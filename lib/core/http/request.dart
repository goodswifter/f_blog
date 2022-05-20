///
/// Author       : zhongaidong
/// Date         : 2022-04-22 11:20:07
/// Description  : 网络请求类
///
import 'package:blog/entity/request_result_entity.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:blog/core/base/get_extension.dart';
import 'package:get/get.dart';

import 'http_request.dart';
import 'request_api.dart';

class Request {
  /// 发起GET请求
  static void get<T>(
    String url, {
    params,
    bool isJson = false,
    bool dialog = true,
    Success<T>? success,
    Fail? fail,
  }) {
    _request(Method.get, url,
        params: params,
        isJson: isJson,
        dialog: dialog,
        success: success,
        fail: fail);
  }

  /// 发起POST请求
  static void post<T>(
    String url, {
    params,
    bool isJson = false,
    bool dialog = true,
    Success<T>? success,
    Fail? fail,
  }) {
    _request(Method.post, url,
        params: params,
        isJson: isJson,
        dialog: dialog,
        success: success,
        fail: fail);
  }

  /// 发起请求公共方法
  static void _request<T>(
    Method method,
    String url, {
    params = const {},
    bool isJson = false,
    bool dialog = true,
    Success<T>? success,
    Fail? fail,
  }) {
    if (dialog) Get.showLoading();

    debugPrint("request url ==============> ${RequestApi.baseurl}$url");

    // 校验参数中是否携带URL
    if (params != null && params is Map) {
      params.forEach((key, value) {
        if (url.contains(key)) {
          url = url.replaceAll(':$key', value.toString());
        }
      });
    }

    // 开启请求
    HttpRequest.request(method, url, params: params, isJson: isJson,
        success: (result) {
      if (dialog) Get.dismiss();

      if (success != null && result is Map<String, dynamic>) {
        var resultModel = RequestResultEntity.fromJson(result);
        debugPrint("request success =>$resultModel");
        if (resultModel.errorCode == 0) {
          success(resultModel.data);
        } else {
          // 其他状态，弹出错误提示信息
          ToastUtil.show(resultModel.errorMsg);
        }
      }
    }, fail: (code, msg) {
      debugPrint("request error =>$msg");
      if (dialog) Get.dismiss();

      ToastUtil.show(msg);
      fail?.call(code, msg);
    });
  }
}
