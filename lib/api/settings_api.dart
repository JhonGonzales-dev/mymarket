import 'dart:async';

import 'package:dio/dio.dart';

class MarketApi {
  static Dio _dio = new Dio();

  static void configureDio() {
    _dio.options.baseUrl = "https://fakestoreapi.com/";

    _dio.options.connectTimeout = 5000;
    _dio.options.contentType = "application/json;charset=UTF-8";
    _dio.options.receiveTimeout = 3000;
  }

//----METHOD GET----------------------------

  static Future httpGet({required String path}) async {
    Map<String, dynamic> _map = <String, dynamic>{};
    Response response;
    try {
      response = await _dio.get(path);
      if (response.statusCode == 200) {
        _map["code"] = response.statusCode;
        _map["data"] = response.data;
        return _map;
      }
    } on DioError catch (e) {
      if (e.response!.statusCode == 401) {
        _map["code"] = e.response!.statusCode;
        _map["data"] = "Algo salio mal";
        return _map;
      } else {
        _map["code"] = 0;
        _map["data"] = "Conexion fallida";
        return _map;
      }
    }
  }
}
