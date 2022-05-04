///
/// Author       : zhongaidong
/// Date         : 2022-04-26 21:59:51
/// Description  : 首页 - 搜索 binding层
///
import 'package:get/get.dart';

import 'search_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SearchController());
  }
}
