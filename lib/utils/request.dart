// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:dio/dio.dart';

import 'package:flutter_getx_template/common/values/config.dart';
import 'package:flutter_getx_template/model/response_model.dart';
import 'package:flutter_getx_template/utils/common_util.dart';

class Request {
  static Request _instance = Request._internal();
  factory Request() => _instance;
  Request get requestInstance => _instance;

  late Dio dio;

  Request._internal() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = new BaseOptions(
      baseUrl: SERVER_API_URL,
      connectTimeout: 20000,

      // Http请求头.
      headers: {},
      contentType: 'application/json; charset=utf-8',
      responseType: ResponseType.json,
    );

    dio = new Dio(options);
    dio.interceptors.add(logIntercepter());
  }

  /// 读取token
  Map<String, dynamic> getAuthorizationHeader() {
    var headers = {
      'Authorization': 'JWT-token',
    };
    return headers;
  }

  Future post(String path, {Map<String, dynamic>? params, Options? options,bool showLoad=true}) async {

    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(headers: getAuthorizationHeader());
    if(showLoad){
      showLoading();
    }

    return dio.post(path, data: params, options: requestOptions).then((value) {
      ResponseModel res = ResponseModel.fromMap(value.data);
      return processResponse(res);
    }).catchError((onError){
      return Future.error(onError);
    }).whenComplete(() => hideLoading());
  }

  processResponse(ResponseModel value) {
    if(value.code != 200){
      return Future.error(value.message??'网络请求出错');
    }
    return Future.value(value.data);
  }
}

//logIntercepter

class logIntercepter extends Interceptor{
  
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    mylog(options.data);
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    mylog(response.data);
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    mylog(err);
    super.onError(err, handler);
  }
}
