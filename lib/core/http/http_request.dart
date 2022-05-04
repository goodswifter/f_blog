///
/// Author       : zhongaidong
/// Date         : 2022-04-22 11:24:31
/// Description  : 请求工具
///
import 'package:blog/entity/userinfo_entity.dart';
import 'package:blog/utils/sp_util/sp_util.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'http_exception.dart';
import 'request_api.dart';

/// 连接超时时间
const int _connectTimeout = 60000;

/// 接收超时时间
const int _receiveTimeout = 60000;

/// 发送超时时间
const int _sendTimeout = 60000;

typedef Success<T> = Function(T data);
/// 刷新成功回调, [over]为是否是最后一页
typedef SuccessOver<T> = Function(T data, bool over);
typedef Fail = Function(int code, String msg);

class HttpRequest {
  /// 是否携带token校验
  static const String _token = '';

  /// 全局Dia对象
  static Dio? _dio;

  /// 创建 dio 实例对象
  static Dio createInstance([bool isJson = false]) {
    if (_dio != null) {
      _dio?.options.contentType =
          isJson ? Headers.jsonContentType : Headers.formUrlEncodedContentType;
    } else {
      // 全局属性：请求前缀、连接超时时间、响应超时时间、发送超时时间
      var options = BaseOptions(
        baseUrl: RequestApi.baseurl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
        headers: {'token': _token},
        // 提交方式：1.表单提交 2.JSON方式提交
        // 请求的Content-Type，默认值是"application/json; charset=utf-8".
        // 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        // 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        contentType: isJson
            ? Headers.jsonContentType
            : Headers.formUrlEncodedContentType,
        // 适用于post form表单提交
        // responseType: ResponseType.json,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
      );
      _dio = Dio(options);
    }
    return _dio!;
  }

  static Future request<T>(
    Method method,
    String path, {
    params,
    bool isJson = false,
    Success? success,
    Fail? fail,
  }) async {
    try {
      // 请求前先检查网络连接
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.none) {
        _onError(HttpException.netError, '网络异常，请检查你的网络！', fail);
        return;
      }
      Dio _dio = createInstance(isJson);
      Response response = await _dio.request(path,
          data: params,
          options: Options(method: method.value, headers: _headerToken()));
      success?.call(response.data);
    } on DioError catch (e) {
      final NetError netError = HttpException.handleException(e);
      _onError(netError.code, netError.msg, fail);
      debugPrint("异常=====>$e");
    }
  }
}

/// 请求时添加cookie
Map<String, dynamic>? _headerToken() {
  /// 自定义Header,如需要添加token信息请调用此参数
  UserinfoEntity? info = SpUtil.getUserinfo();
  if (info == null) return null;

  Map<String, dynamic> httpHeaders = {
    'Cookie':
        'loginUserName=${info.username};loginUserPassword=${info.password}',
  };
  return httpHeaders;
}

/// 错误处理
void _onError(int code, String msg, Fail? fail) {
  if (code == 0) {
    code = HttpException.unknownError;
    msg = '未知异常';
  }
  if (fail != null) {
    fail(code, msg);
  }
}

/// 请求类型枚举
enum Method { get, post, delete, put, patch, head }

/// 请求类型值
extension MethodExtension on Method {
  String get value => [
        'GET',
        'POST',
        'DELETE',
        'PUT',
        'PATCH',
        'HEAD',
      ][index];
}
