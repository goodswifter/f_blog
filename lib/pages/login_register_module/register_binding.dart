///
/// Author       : zhongaidong
/// Date         : 2022-04-23 23:10:08
/// Description  : 注册 binding层
///
import 'package:get/get.dart';

import 'register_controller.dart';

class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController());
  }
}
