import 'dart:typed_data';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../azure_create_task.dart';
import '../models/tast_create_model.dart';

extension NumX on num {
  Widget get vertical => SizedBox(
        height: toDouble(),
      );
}

enum Status { initial, loading, success, failure }

class ScreenShotScaffold extends StatelessWidget {
  const ScreenShotScaffold({
    super.key,
    this.appBar,
    this.backgroundColor,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.drawer,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.drawerScrimColor,
    this.endDrawer,
    this.endDrawerEnableOpenDragGesture = true,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.floatingActionButton,
    this.floatingActionButtonAnimator,
    this.floatingActionButtonLocation,
    this.onDrawerChanged,
    this.onEndDrawerChanged,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.persistentFooterButtons,
    this.primary = true,
    this.resizeToAvoidBottomInset,
    this.restorationId,
    required this.controller,
    required this.config,
    this.body,
  });
  final List<Widget>? persistentFooterButtons;
  final bool primary;
  final bool? resizeToAvoidBottomInset;
  final String? restorationId;
  final AlignmentDirectional persistentFooterAlignment;
  final void Function(bool)? onDrawerChanged;
  final void Function(bool)? onEndDrawerChanged;
  final PreferredSizeWidget? appBar;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final Widget? drawer;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final Color? drawerScrimColor;
  final Widget? endDrawer;
  final bool endDrawerEnableOpenDragGesture;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final Widget? floatingActionButton;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final ScreenshotController controller;
  final ScreenShotConfig config;
  final Widget? body;

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Stack(
          children: [
            Screenshot<void>(
              controller: controller,
              child: Scaffold(
                appBar: appBar,
                backgroundColor: backgroundColor,
                body: body,
                bottomNavigationBar: bottomNavigationBar,
                bottomSheet: bottomSheet,
                drawer: drawer,
                drawerDragStartBehavior: drawerDragStartBehavior,
                drawerEdgeDragWidth: drawerEdgeDragWidth,
                drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
                drawerScrimColor: drawerScrimColor,
                endDrawer: endDrawer,
                endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
                extendBody: extendBody,
                extendBodyBehindAppBar: extendBodyBehindAppBar,
                floatingActionButton: floatingActionButton,
                floatingActionButtonAnimator: floatingActionButtonAnimator,
                floatingActionButtonLocation: floatingActionButtonLocation,
                key: key,
                onDrawerChanged: onDrawerChanged,
                onEndDrawerChanged: onEndDrawerChanged,
                persistentFooterAlignment: persistentFooterAlignment,
                persistentFooterButtons: persistentFooterButtons,
                primary: primary,
                resizeToAvoidBottomInset: resizeToAvoidBottomInset,
                restorationId: restorationId,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 20,
                ),
                child: FloatingActionButton(
                  backgroundColor: Colors.grey.withOpacity(.2),
                  mini: true,
                  onPressed: () async {
                    await controller.capture().then(
                          (value) => _callback(context, value),
                        );
                  },
                  child: const Icon(
                    Icons.camera_alt_outlined,
                  ),
                ),
              ),
            )
          ],
        );
      },
    );
  }

  void _callback(BuildContext context, Uint8List? uint8list) {
    if (uint8list != null) {
      showModalBottomSheet<void>(
        context: context,
        builder: (context) => ReportAzureTaskDialog(
          uint8list: uint8list,
          config: config,
        ),
      );
    } else {
      const snackBar = SnackBar(
        content: Text('Screenshot error!'),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}

class ReportAzureTaskDialog extends StatefulWidget {
  const ReportAzureTaskDialog({
    super.key,
    required this.uint8list,
    required this.config,
  });
  final Uint8List uint8list;
  final ScreenShotConfig config;

  @override
  State<ReportAzureTaskDialog> createState() => _ReportAzureTaskDialogState();
}

class _ReportAzureTaskDialogState extends State<ReportAzureTaskDialog> {
  final _titleCtl = TextEditingController();
  final _assignToCtl = TextEditingController();
  final _descriptionCtl = TextEditingController();
  late List<TextEditingController> reproSteps;
  Status status = Status.initial;
  String? errorStr;

  Widget get _buildWidget {
    switch (status) {
      case Status.initial:
        return ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: Image.memory(
                widget.uint8list,
                width: 300,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            8.vertical,
            TextFormField(
              controller: _titleCtl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Title'),
              ),
            ),
            8.vertical,
            TextFormField(
              controller: _assignToCtl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('AssignTo (abc@cde.com)'),
              ),
            ),
            8.vertical,
            TextFormField(
              controller: _descriptionCtl,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Description'),
              ),
            ),
            for (int i = 0; i < reproSteps.length; i++)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: reproSteps[i],
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          label: Text('Step ${i + 1}'),
                        ),
                      ),
                    ),
                    if (reproSteps.length > 1)
                      GestureDetector(
                        onTap: () => setState(
                          () =>
                              reproSteps = List.from(reproSteps)..removeLast(),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8),
                          child: Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () => reproSteps = List.from(reproSteps)
                    ..add(
                      TextEditingController(),
                    ),
                );
              },
              child: const Text('Add step'),
            ),
            ElevatedButton(
              onPressed: _submit,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text('Submit'),
            ),
          ],
        );
      case Status.loading:
        return const Center(
          child: CircularProgressIndicator(),
        );
      case Status.success:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Upload Success',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              6.vertical,
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Back'),
              ),
            ],
          ),
        );
      case Status.failure:
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Upload Failure\n$errorStr',
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
              6.vertical,
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: const Text('Back'),
              ),
            ],
          ),
        );
    }
  }

  @override
  void initState() {
    super.initState();
    reproSteps = [TextEditingController()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: _buildWidget,
      ),
    );
  }

  Future<void> _submit() async {
    try {
      setState(() => status = Status.loading);
      final time = DateTime.now().toIso8601String();
      final resultAttachments = await FlutterAzure.instance.createAttachments(
        userName: widget.config.userName,
        token: widget.config.token,
        organization: widget.config.organization,
        project: widget.config.project,
        fileData: widget.uint8list,
        fileName: 'img_$time.png',
      );
      final attachments =
          resultAttachments.fold((l) => throw Exception(l), (r) => r);
      final description =
          '<div>${_descriptionCtl.text}</div><img src="${attachments.url}"/>';
      final step = [
        for (int i = 0; i < reproSteps.length; i++)
          '<li>${i + 1}. ${reproSteps[i].text}</li>',
      ].join();
      final resultTask = await FlutterAzure.instance.createTask(
        userName: widget.config.userName,
        token: widget.config.token,
        organization: widget.config.organization,
        project: widget.config.project,
        task: TaskCreateModel(
          title: _titleCtl.text,
          assignedTo: _assignToCtl.text,
          description: description,
          reproSteps: '<ul>$step</ul>',
        ),
      );
      resultTask.fold(
        (l) => setState(() {
          status = Status.failure;
          errorStr = 'create task error: $l';
        }),
        (r) => setState(() => status = Status.success),
      );
    } catch (e) {
      setState(() {
        status = Status.failure;
        errorStr = 'create task: $e';
      });
    }
  }
}
