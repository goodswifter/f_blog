///
/// Author       : zhongaidong
/// Date         : 2022-04-23 18:38:57
/// Description  : 启动页 binding层
///
import 'package:blog/pages/splash_page/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
