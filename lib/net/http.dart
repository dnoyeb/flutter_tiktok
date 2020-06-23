import 'dart:io';

import 'package:dio/dio.dart';

Dio dio = Dio(BaseOptions(
  baseUrl: "http://10.1.36.49:3000/",
  connectTimeout: 5000,
  receiveTimeout: 100000,
  // 5s
  headers: {
    HttpHeaders.userAgentHeader: "dio",
    "api": "1.0.0",
  },
  contentType: Headers.jsonContentType,
  // Transform the response data to a String encoded with UTF8.
  // The default value is [ResponseType.JSON].
  responseType: ResponseType.plain,
));
