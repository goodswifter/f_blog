///
/// Author       : zhongaidong
/// Date         : 2022-04-25 18:28:15
/// Description  : Webview controller层
///
import 'package:blog/core/base/controller/base_get_controller.dart';
import 'package:blog/entity/webview_entity.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/mine_controller.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:get/get.dart';

class WebviewController extends BaseGetController {
  var mineController = Get.find<MineController>();
  /// 加载URL
  WebviewEntity detail = Get.arguments;

  /// 进度条
  var progress = 0.0.obs;

  /// 是否收藏
  var isCollect = false.obs;

  /// 控制收藏的取消与结束
  var collectAtState = false.obs;

  @override
  void onInit() {
    super.onInit();
    isCollect.value = detail.isCollect;
  }

  /// 收藏 & 取消收藏
  /// 注意此处，从收藏进入取消收藏的ID是originId
  collectArticle() {
    if (!isCollect.value) {
      collectAtState.value = true;
      Future.delayed(const Duration(milliseconds: 900)).then((value) {
        collectAtState.value = false;
      });
    }

    complexRequest.collectArticle(
        isCollect.value && detail.originId != 0 ? detail.originId : detail.id,
        isCollect: isCollect.value, success: (data) {
      ToastUtil.show(
          isCollect.value ? S.current.collectQuit : S.current.collectSuccess);
      isCollect.value = !isCollect.value;

      // 更新用户信息
      mineController.updateUserinfo();
      update();
    });
  }
}
