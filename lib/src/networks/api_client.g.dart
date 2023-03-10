// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiClient implements ApiClient {
  _ApiClient(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://dev.azure.com';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<HttpResponse<TaskModel>> createTask(
    organization,
    project,
    type, {
    required authToken,
    required json,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/octet-stream',
      r'Ocp-Apim-Subscription-Key': 'abc',
      r'Authorization': authToken,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = json;
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<TaskModel>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/octet-stream',
    )
            .compose(
              _dio.options,
              '/${organization}/${project}/_apis/wit/workitems/${type}?api-version=7.0',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = TaskModel.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  @override
  Future<HttpResponse<Attachments>> createAttachments(
    organization,
    project,
    fileName,
    file, {
    required authToken,
  }) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{
      r'Content-Type': 'application/json-patch+json',
      r'Authorization': authToken,
    };
    _headers.removeWhere((k, v) => v == null);
    final _data = Stream.fromIterable(file.readAsBytesSync().map((i) => [i]));
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<HttpResponse<Attachments>>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
      contentType: 'application/json-patch+json',
    )
            .compose(
              _dio.options,
              '/${organization}/${project}/_apis/wit/attachments/fileName=${fileName}?api-version=7.0',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Attachments.fromJson(_result.data!);
    final httpResponse = HttpResponse(value, _result);
    return httpResponse;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
