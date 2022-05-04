/// 
/// Author       : zhongaidong
/// Date         : 2022-04-25 22:16:11
/// Description  : 积分排行榜 binding层
/// 
import 'package:get/get.dart';

import 'ranking_controller.dart';

class RankingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RankingController());
  }
}
