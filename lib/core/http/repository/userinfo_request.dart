/// 
/// Author       : zhongaidong
/// Date         : 2022-04-29 22:28:18
/// Description  : 用户信息请求仓库
/// 
import 'package:blog/core/http/request.dart';
import 'package:blog/core/http/request_api.dart';
import 'package:blog/entity/userinfo_entity.dart';

import '../http_request.dart';

class UserinfoRequest {
  /// 获取用户信息
  getUserinfo({
    Success<UserinfoEntity>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
      RequestApi.apiUserInfo,
      dialog: false,
      success: (data) {
        if (success != null) {
          var userInfo = data["userInfo"];
          userInfo = UserinfoEntity.fromJson(userInfo);
          success(userInfo);
        }
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }
}