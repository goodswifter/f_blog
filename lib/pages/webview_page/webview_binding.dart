/// 
/// Author       : zhongaidong
/// Date         : 2022-04-25 18:28:07
/// Description  : Webview binding层
/// 
import 'webview_controller.dart';
import 'package:get/get.dart';

class WebviewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebviewController());
  }
}