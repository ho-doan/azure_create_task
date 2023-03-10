import 'package:azure_create_task/src/models/sub_task_create.dart';

class TaskCreateModel {
  /// ![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_contain.png)
  final String title;

  /// ![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_contain.png)
  final String? description;

  /// ![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_contain.png)
  final String? reproSteps;

  /// ![](https://flutter.github.io/assets-for-api-docs/assets/painting/box_fit_contain.png)
  final String? assignedTo;

  TaskCreateModel({
    required this.title,
    this.description,
    this.reproSteps,
    this.assignedTo,
  });

  List<SubTaskCreate> toBody() => [
        SubTaskCreate(
          op: 'add',
          from: null,
          path: '/fields/System.Title',
          value: title,
        ),
        if (description != null)
          SubTaskCreate(
            op: 'add',
            from: null,
            path: '/fields/System.Description',
            value: description,
          ),
        if (reproSteps != null)
          SubTaskCreate(
            op: 'add',
            from: null,
            path: '/fields/Microsoft.VSTS.TCM.ReproSteps',
            value: reproSteps,
          ),
        if (assignedTo != null)
          SubTaskCreate(
            op: 'add',
            from: null,
            path: '/fields/System.AssignedTo',
            value: assignedTo,
          ),
      ];
}
