import 'dart:convert';
import 'dart:developer';
import 'package:desktivo/main.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://www.omdbapi.com/';
  String? token;
  Map<String, String>? mainHeaders;
  String? apiKey = "859e0065";

  ApiClient({this.token}) {
    updateHeader(token);
  }

  void updateHeader(String? token) {
    mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
    };
  }

  Future<Response> postData(String path, Map<String, dynamic>? body,
      Map<String, dynamic>? headers) async {
    try {
      Response response = await _dio
          .post(
            _baseUrl + path,
            data: body,
            options: Options(headers: headers ?? mainHeaders),
          )
          .timeout(const Duration(seconds: 60));
      return response;
    } catch (e) {
      log("From Post Request");
      log(e.toString());
      return Response(
        statusCode: 1,
        requestOptions: RequestOptions(
          headers: headers,
          baseUrl: _baseUrl + path,
        ),
      );
    }
  }

  Future<Response> putData(String path, Map<String, dynamic> body,
      Map<String, dynamic>? headers) async {
    try {
      Response response = await _dio
          .put(
            _baseUrl + path,
            data: jsonEncode(body),
            options: Options(headers: headers ?? mainHeaders),
          )
          .timeout(const Duration(seconds: 60));
      return response;
    } catch (e) {
      log("From Put Request");
      log(e.toString());
      return Response(
        statusCode: 1,
        requestOptions: RequestOptions(
          headers: headers,
          baseUrl: _baseUrl + path,
        ),
      );
    }
  }

  Future<Response> getData(String path) async {
    try {
      Response response = await _dio
          .get(
            '$_baseUrl?$path&apikey=$apiKey',
            options: Options(headers: mainHeaders),
          )
          .timeout(const Duration(seconds: 50));
      return response;
    } catch (e) {
      log("From Get Request");
      log(e.toString());
      return Response(
        statusCode: 1,
        requestOptions: RequestOptions(
          headers: mainHeaders,
          baseUrl: _baseUrl + path,
        ),
      );
    }
  }

  Future<Response> getDataWithParams(String path, Map<String, dynamic>? headers,
      Map<String, dynamic>? params) async {
    try {
      Response response = await _dio
          .get(
            _baseUrl + path,
            options: Options(headers: headers ?? mainHeaders),
            queryParameters: params,
          )
          .timeout(const Duration(seconds: 50));
      return response;
    } catch (e) {
      log("From Get With Params Request");
      log(e.toString());
      return Response(
        statusCode: 1,
        requestOptions: RequestOptions(
          headers: headers,
          baseUrl: _baseUrl + path,
        ),
      );
    }
  }
}
