library azure_create_task;

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:azure_create_task/src/models/attachments.dart';
import 'package:azure_create_task/src/models/task_model.dart';
import 'package:azure_create_task/src/networks/api_client.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'src/models/tast_create_model.dart';

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
  FlutterAzure._() {
    _dio = Dio();
    _dio.options.connectTimeout = 4;
    _apiClient = ApiClient(_dio);
  }
  static final instance = FlutterAzure._();
  late ApiClient _apiClient;
  late Dio _dio;

  Future<Either<String, TaskModel>> createTask({
    required String userName,
    required String token,
    required String organization,
    required String project,
    TypeAzure typeAzure = TypeAzure.bug,
    String? typeStr,
    required TaskCreateModel task,
  }) async {
    final result = await _apiClient.createTask(
      organization,
      project,
      typeStr ?? typeAzure.nameX,
      authToken: 'Basic ${base64.encode(utf8.encode('$userName:$token'))}',
      json: jsonEncode(task.toBody().map((e) => e.toJson()).toList()),
    );
    if (result.response.statusCode == 200) {
      return Right(result.data);
    } else {
      return Left(
        '${result.response.statusCode}:${result.response.statusMessage}',
      );
    }
  }

  Future<Either<String, Attachments>> createAttachments({
    required String userName,
    required String token,
    required String organization,
    required String project,
    required Uint8List fileData,
    required String fileName,
  }) async {
    final fileConvert = await File('image').writeAsBytes(fileData);
    final result = await _apiClient.createAttachments(
      organization,
      project,
      fileName,
      fileConvert,
      authToken: 'Basic ${base64.encode(utf8.encode('$userName:$token'))}',
    );
    if (result.response.statusCode == 200) {
      return Right(result.data);
    } else {
      return Left(
        '${result.response.statusCode}:${result.response.statusMessage}',
      );
    }
  }
}
