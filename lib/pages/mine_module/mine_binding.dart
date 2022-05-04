/// 
/// Author       : zhongaidong
/// Date         : 2022-05-01 18:15:20
/// Description  : 我的模块 binding层
/// 
import 'package:blog/pages/mine_module/about/about_controller.dart';
import 'package:blog/pages/mine_module/collect/collect_controller.dart';
import 'package:blog/pages/mine_module/feedback/feedback_controller.dart';
import 'package:blog/pages/mine_module/history/history_controller.dart';
import 'package:blog/pages/mine_module/personal_info/personal_info_controller.dart';
import 'package:blog/pages/mine_module/point/point_controller.dart';
import 'package:blog/pages/mine_module/setting/setting_controller.dart';
import 'package:blog/pages/mine_module/share/share_controller.dart';
import 'package:get/get.dart';

class MineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PersonalInfoController());
    Get.lazyPut(() => SettingController());
    Get.lazyPut(() => CollectController());
    Get.lazyPut(() => ShareController());
    Get.lazyPut(() => PointController());
    Get.lazyPut(() => HistoryController());
    Get.lazyPut(() => AboutController());
    Get.lazyPut(() => FeedbackController());
  }
}
