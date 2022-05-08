///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:01:03
/// Description  : 设置页面 controller层
///
import 'package:blog/core/base/controller/base_get_controller.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/mine_controller.dart';
import 'package:blog/utils/file/cache_util.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:get/get.dart';

class SettingController extends BaseGetController {
  /// 缓存大小
  var cache = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadCache();
  }

  /// 加载缓存
  loadCache() {
    CacheUtil.loadCache().then((value) {
      cache.value = CacheUtil.byte2FitMemorySize(value);
    });
  }

  /// 清除缓存
  clearCacheFile() {
    CacheUtil.clearCache().then((value) {
      loadCache();
      ToastUtil.show(
          value ? S.current.settingCacheSuccess : S.current.settingCacheFail);
    });
  }

  /// 退出登录
  exitLoginState() {
    loginRequest.exitLogin();
    Get.back();
    Get.find<MineController>().clearUserinfo();
  }
}
