library azure_create_task;

import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:native_screenshot/native_screenshot.dart';

import 'azure_create_task.dart';
import 'src/models/attachments.dart';
import 'src/models/task_model.dart';
import 'src/models/tast_create_model.dart';

export 'src/models/config.dart';
export 'src/widgets/screen_shot_scaff_fold.dart';

enum TypeAzure { bug, task, issue }

extension TypeAzureX on TypeAzure {
  String get nameX {
    switch (this) {
      case TypeAzure.bug:
        return 'Bug';
      case TypeAzure.task:
        return 'Task';
      case TypeAzure.issue:
        return 'Issue';
    }
  }
}

class FlutterAzure {
  FlutterAzure._();
  static final instance = FlutterAzure._();

  late ScreenShotConfig _config;

  Future<void> _screenShot({
    required void Function() callbackErrorTakeScreenShot,
    required void Function(Uint8List) callback,
  }) async {
    final path = await NativeScreenshot.takeScreenshot();
    if (path == null) {
      callbackErrorTakeScreenShot();
      return;
    }

    final file = File(path);
    final data = file.readAsBytesSync();
    callback(data);
  }

  void initial(
    ScreenShotConfig config,
    BuildContext context,
  ) {
    _config = config;
    return Overlay.of(context).insert(
      OverlayEntry(builder: (context) {
        return Positioned(
          bottom: 45,
          left: 30,
          child: Material(
            color: Colors.transparent,
            child: GestureDetector(
              onTap: () => _screenShot(callbackErrorTakeScreenShot: () {
                const snackBar = SnackBar(
                  content: Text('Screenshot error!'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }, callback: (data) {
                showModalBottomSheet<void>(
                  context: context,
                  builder: (context) => ReportAzureTaskDialog(
                    uint8list: data,
                  ),
                );
              }),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(.4),
                ),
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.bug_report,
                  size: 24,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  /// typeAzure && typeStr
  /// ![typeAzure](https://raw.githubusercontent.com/DoanpPhiHo/azure_create_task/master/assets/Screenshot%202023-03-10%20at%2015.24.52.png)
  Future<Either<String, TaskModel>> createTask({
    TypeAzure typeAzure = TypeAzure.bug,
    String? typeStr,
    required TaskCreateModel task,
  }) async {
    final headers = {
      'Content-Type': 'application/json-patch+json',
      'Authorization':
          'Basic ${base64.encode(utf8.encode('${_config.userName}:${_config.token}'))}',
    };
    final urlStr =
        'https://dev.azure.com/${_config.organization}/${_config.project}/_apis/wit/workitems/\$${typeStr ?? typeAzure.nameX}?api-version=7.0';
    log('url request create: $urlStr');
    final request = http.Request('POST', Uri.parse(urlStr));
    request.body = json.encode(task.toBody().map((e) => e.toJson()).toList());
    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final Map<String, dynamic> dataMap = json.decode(data);
      return Right(TaskModel.fromJson(dataMap));
    } else {
      return Left(
        '${response.statusCode}:${response.reasonPhrase}',
      );
    }
  }

  Future<Either<String, Attachments>> createAttachments({
    required Uint8List fileData,
    required String fileName,
  }) async {
    final headers = {
      'Content-Type': 'application/octet-stream',
      'Authorization':
          'Basic ${base64.encode(utf8.encode('${_config.userName}:${_config.token}'))}',
    };
    final request = http.Request(
        'POST',
        Uri.parse(
            'https://dev.azure.com/${_config.organization}/${_config.project}/_apis/wit/attachments?fileName=$fileName.png&uploadType=Simple&api-version=7.0'));

    request.bodyBytes = fileData;

    request.headers.addAll(headers);

    final response = await request.send();

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = await response.stream.bytesToString();
      final Map<String, dynamic> dataMap = jsonDecode(data);
      return Right(Attachments.fromJson(dataMap));
    } else {
      return Left('${response.statusCode}: ${response.reasonPhrase}');
    }
  }
}
