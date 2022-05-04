/// 
/// Author       : zhongaidong
/// Date         : 2022-04-23 18:38:05
/// Description  : 登录 binding层
/// 
import 'package:get/get.dart';

import '../complex_module/01_home_page/home_controller.dart';
import '../complex_module/02_square_page/square_controller.dart';
import '../complex_module/03_ask_page/ask_controller.dart';
import '../mine_module/mine_controller.dart';
import '../project_module/project_controller.dart';
import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SquareController());
    Get.lazyPut(() => AskController());
    Get.lazyPut(() => ProjectController());
    Get.lazyPut(() => MineController());
  }
}