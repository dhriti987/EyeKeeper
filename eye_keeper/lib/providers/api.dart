import 'package:dio/dio.dart';

var apiOptions = BaseOptions(
  baseUrl: 'http://127.0.0.1:8000/',
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio api = Dio(apiOptions);
