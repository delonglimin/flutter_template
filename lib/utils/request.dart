// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';

import 'package:flutter_getx_template/common/values/config.dart';
import 'package:flutter_getx_template/model/response_model.dart';
import 'package:flutter_getx_template/utils/common_util.dart';
import 'package:flutter_getx_template/utils/network_manager.dart';

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
    dio.interceptors.add(LogIntercepter());
  }

  /// 读取token
  Map<String, dynamic> getAuthorizationHeader() {
    var headers = {
      'Authorization': 'JWT-token',
    };
    return headers;
  }

  Future post(String path,
      {Map<String, dynamic>? params,
      Options? options,
      bool showLoad = true}) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(headers: getAuthorizationHeader());
    if (NetworkManager.networkState == ConnectivityResult.none) {
      showToast('网络未连接');
      return Future.error('网络未连接');
    }
    if (showLoad) {
      showLoading();
    }

    return dio.post(path, data: params, options: requestOptions).then((value) {
      ResponseModel res = ResponseModel.fromMap(value.data);
      return processResponse(res);
    }).catchError((onError) {
      return Future.error(onError);
    }).whenComplete(() => hideLoading());
  }

  Future get(String path,
      {Map<String, dynamic>? params,
      Options? options,
      bool showLoad = true}) async {
    Options requestOptions = options ?? Options();
    requestOptions = requestOptions.copyWith(headers: getAuthorizationHeader());
    if (NetworkManager.networkState == ConnectivityResult.none) {
      showToast('网络未连接');
      return Future.error('网络未连接');
    }
    if (showLoad) {
      showLoading();
    }

    return dio
        .get(path, queryParameters: params, options: requestOptions)
        .then((value) {
      ResponseModel res = ResponseModel.fromMap(value.data);
      return processResponse(res);
    }).catchError((onError) {
      showToast(onError.toString());
      return Future.error(onError);
    }).whenComplete(() => hideLoading());
  }

  processResponse(ResponseModel value) {
    if (value.code != 200) {
      showToast(value.message ?? '网络请求出错');
      return Future.error(value.message ?? '网络请求出错');
    }
    return Future.value(value.data);
  }
}

//logIntercepter

class LogIntercepter extends Interceptor {
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
