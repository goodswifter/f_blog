///
/// Author       : zhongaidong
/// Date         : 2022-04-22 14:23:35
/// Description  : 登录模块请求仓库
///
import 'package:blog/core/http/http_request.dart';
import 'package:blog/core/http/request.dart';
import 'package:blog/entity/userinfo_entity.dart';
import 'package:blog/utils/sp_util/sp_util.dart';

import '../request_api.dart';

class LoginRequest {
  /// 注册用户
  register({
    required String account,
    required String password,
    required String repassword,
    Success<UserinfoEntity>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(
      RequestApi.apiRegister,
      params: {
        "username": account,
        "password": password,
        "repassword": repassword
      },
      success: (data) {
        var registerInfo = UserinfoEntity.fromJson(data);
        registerInfo.password = password;
        SpUtil.saveUserinfo(registerInfo);
        success?.call(registerInfo);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 登录
  login(
    String account,
    String password, {
    Success<UserinfoEntity>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(
      RequestApi.apiLogin,
      params: {"username": account, "password": password},
      success: (data) {
        var loginInfo = UserinfoEntity.fromJson(data);
        loginInfo.password = password;
        SpUtil.saveUserinfo(loginInfo);
        success?.call(loginInfo);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 退出登录
  exitLogin({
    Success<bool>? success,
    Fail? fail,
  }) {
    Request.post<dynamic>(
      RequestApi.apiLogout,
      dialog: false,
      success: (data) => success?.call(true),
      fail: (code, msg) => fail?.call(code, msg),
    );
  }
}
