import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http_interceptor.dart';
import '../../features/authentication/data/datasource/auth_local_data_source.dart';
import '../../features/authentication/data/models/response/login/login_response.dart';
import '../errors/app_exceptions.dart';
import 'app_log.dart';
import 'environment.dart';

class AppHTTPClient {
  AppHTTPClient(this.authLocalDataSource);

  final AuthLocalDataSource authLocalDataSource;

  final http.Client _client = InterceptedClient.build(
      interceptors: <InterceptorContract>[
        AuthInterceptor(authLocalDataSource: Get.find())
      ]);

  static const int requestTimeout = 30;
  static String baseUrl = environment.url;

  //GET
  Future<Map<String, dynamic>> get(String endpoint) async {
    final Uri uri = Uri.parse(
      baseUrl + endpoint,
    );
    AppLog.i('============================ BASE URL ========================');
    AppLog.i(baseUrl);
    AppLog.i('============================ ENDPOINT ========================');
    AppLog.i(endpoint);
    try {
      final http.Response response = await _client.get(uri).timeout(
            const Duration(seconds: requestTimeout),
          );
      return _processResponse(response, endpoint);
    } on SocketException catch (err) {
      throw FetchDataException('Connection problem: $err', uri.toString());
    } on TimeoutException catch (err) {
      throw ApiNotRespondingException('Request Timeout: $err', uri.toString());
    }
  }

  // POST
  Future<Map<String, dynamic>> post(String endpoint,
      {required Map<String, dynamic> body}) async {
    final Uri uri = Uri.parse(baseUrl + endpoint);
    AppLog.i('============================ BASE URL ========================');
    AppLog.i(baseUrl);
    AppLog.i('============================ ENDPOINT ========================');
    AppLog.i(endpoint);
    AppLog.i('====================== BODY SENT =========================');
    AppLog.i(body);
    try {
      // Filter out null values from the body
      final Map<String, dynamic> filteredBody = (body)
          .entries
          .where((MapEntry<String, dynamic> entry) => entry.value != null)
          .fold<Map<String, dynamic>>(
        <String, dynamic>{},
            (Map<String, dynamic> map, MapEntry<String, dynamic> entry) =>
        map..[entry.key] = entry.value,
      );


      final http.Response response =
          await _client.post(uri, body: jsonEncode(filteredBody));
      return _processResponse(response, endpoint);
    } on SocketException  {
      throw FetchDataException('Connection problem ', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('Request Timeout', uri.toString());
    }
  }

  //PUT
  Future<Map<String, dynamic>> put(String endpoint, {dynamic body}) async {
    // Filter out null values from the body
    final Map<String, dynamic> filteredBody = (body as Map<String, dynamic>)
        .entries
        .where((MapEntry<String, dynamic> entry) => entry.value != null)
        .fold<Map<String, dynamic>>(
      <String, dynamic>{},
      (Map<String, dynamic> map, MapEntry<String, dynamic> entry) =>
          map..[entry.key] = entry.value,
    );

    final Uri uri = Uri.parse(baseUrl + endpoint);
    AppLog.i('============================ ENDPOINT ========================');
    AppLog.i(endpoint);
    AppLog.i('====================== BODY SENT =========================');
    AppLog.i(filteredBody);
    try {
      final http.Response response =
          await _client.put(uri, body: jsonEncode(filteredBody));
      return _processResponse(response, endpoint);
    } on SocketException {
      throw FetchDataException('Connection problem', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('Request Timeout', uri.toString());
    }
  }

  //DELETE

  Future<Map<String, dynamic>> delete(String endpoint) async {
    final Uri uri = Uri.parse(baseUrl + endpoint);
    AppLog.i('============================ ENDPOINT ========================');
    AppLog.i(endpoint);
    try {
      final http.Response response = await _client.delete(uri);
      return _processResponse(response, endpoint);
    } on SocketException {
      throw FetchDataException('Connection problem', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException('Request Timeout', uri.toString());
    }
  }

  Map<String, dynamic> _processResponse(
      http.Response response, String endpoint) {

    if (response.statusCode != 200 && response.statusCode != 201) {
      AppLog.i(
          '============================ ERROR THROWN ========================');
      AppLog.i(utf8.decode(response.bodyBytes));
    }
    switch (response.statusCode) {
      case 201:
      case 200:
        final dynamic responseJson =
            jsonDecode(utf8.decode(response.bodyBytes));
        final String? totalCount = response.headers['total-count'];
        AppLog.i(
            '============================ BODY RECEIVED ========================');
        AppLog.i(response.body);
        late Map<String, dynamic> data;
        if (responseJson is List) {
          data = <String, dynamic>{
            'items': responseJson,
            'total_count': totalCount
          };
        }

        if (responseJson is Map<String, dynamic>) {
          if (endpoint.contains('users/auth/login')) {
            final Map<String, String> header = response.headers;
            data = responseJson;
            data['user_token_validation']['token'] = header['access_token'];
          } else {
            data = responseJson;
          }
        }
        return data;
      case 400:
        throw BadRequestException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 401:
        throw UnauthorizedException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 403:
        throw UnauthorizedException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 500:
        throw FetchDataException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      default:
        throw FetchDataException(
          'Error occurred with code ${response.statusCode}',
          response.request!.url.toString(),
        );
    }
  }
}

class AuthInterceptor extends InterceptorContract  {
  AuthInterceptor({required AuthLocalDataSource authLocalDataSource})
      : _authLocalDataSource = authLocalDataSource;

  final AuthLocalDataSource _authLocalDataSource;

  @override
  FutureOr<BaseRequest> interceptRequest({required BaseRequest request}) async {
    final LoginResponse? response = _authLocalDataSource.authResponse ??
        await _authLocalDataSource.getAuthResponse();
    final Map<String, String> headers = Map<String, String>.from(request.headers);
    final Map<String, String> newHeaders = <String, String>{
      HttpHeaders.contentTypeHeader: 'application/json',
      'Authorization': 'Bearer ${response?.token}'
    };
    headers.addAll(newHeaders);

    AppLog.i('==================== HEADER SENT IS ==================');
    AppLog.i(headers);

    return request.copyWith(
      url: request.url,
      headers: headers
    );
  }

  @override
  FutureOr<BaseResponse> interceptResponse({required BaseResponse response}) async {
    return response;
  }


}
