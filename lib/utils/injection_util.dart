///
/// Author       : zhongaidong
/// Date         : 2022-04-22 14:18:08
/// Description  : 依赖注入工具类
///
import 'package:blog/core/http/repository/complex_request.dart';
import 'package:blog/core/http/repository/login_request.dart';
import 'package:blog/core/http/repository/mine_request.dart';
import 'package:blog/core/http/repository/project_request.dart';
import 'package:blog/core/http/repository/userinfo_request.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InjectionUtil {
  /// 初始化依赖注入, 可全局使用
  static init() {
    // 注入一个异步创建的实例shared_preferences, 供全局使用
    Get.putAsync<SharedPreferences>(() => SharedPreferences.getInstance());
    // 网络请求库
    Get.lazyPut(() => LoginRequest());
    Get.lazyPut(() => ComplexRequest());
    Get.lazyPut(() => ProjectRequest());
    Get.lazyPut(() => MineRequest());
    Get.lazyPut(() => UserinfoRequest());
  }
}
