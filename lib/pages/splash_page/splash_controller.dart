///
/// Author       : zhongaidong
/// Date         : 2022-04-23 18:23:19
/// Description  : 启动页 controller层
///
import 'package:blog/core/base/controller/base_get_controller.dart';

class SplashController extends BaseGetController {
  /// 用来控制动画页面的透明度
  double opacity = 0;

  @override
  void onInit() {
    super.onInit();

    lazyInitAnim();
  }

  lazyInitAnim() {
    Future.delayed(const Duration(milliseconds: 200), () {
      opacity = 1.0;
      update();
    });
  }
}
