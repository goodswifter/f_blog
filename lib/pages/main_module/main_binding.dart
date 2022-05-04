///
/// Author       : zhongaidong
/// Date         : 2022-04-23 08:01:02
/// Description  : 主模块binding层
///
import 'package:blog/pages/mine_module/mine_controller.dart';
import 'package:blog/pages/project_module/project_controller.dart';
import 'package:get/get.dart';

import '../complex_module/01_home_page/home_controller.dart';
import '../complex_module/02_square_page/square_controller.dart';
import '../complex_module/03_ask_page/ask_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => SquareController());
    Get.lazyPut(() => AskController());
    Get.lazyPut(() => ProjectController());
    Get.lazyPut(() => MineController());
  }
}
