import 'package:azure_create_task/src/models/attachments.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';
import 'dart:io';

import '../models/task_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://dev.azure.com')
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ApiClient;
  @POST('/{organization}/{project}/_apis/wit/workitems/{type}?api-version=7.0')
  @Headers({
    "Content-Type": "application/octet-stream",
    "Ocp-Apim-Subscription-Key": "abc"
  })
  Future<HttpResponse<TaskModel>> createTask(
    @Path() String organization,
    @Path() String project,
    @Path() String type, {
    @Header("Authorization") required String authToken,
    @Body() required String json,
  });
  @POST(
    '/{organization}/{project}/_apis/wit/attachments/fileName={fileName}?api-version=7.0',
  )
  @Headers({"Content-Type": "application/json-patch+json"})
  Future<HttpResponse<Attachments>> createAttachments(
    @Path() String organization,
    @Path() String project,
    @Path() String fileName,
    @Body() File file, {
    @Header("Authorization") required String authToken,
  });
}
