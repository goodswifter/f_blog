///
/// Author       : zhongaidong
/// Date         : 2022-04-23 18:34:55
/// Description  : 登录 controller层
///
import 'package:blog/core/base/controller/base_get_controller.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/pages/mine_module/mine_controller.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:get/get.dart';

class LoginController extends BaseGetController {
  /// 账号
  String account = '';

  /// 密码
  String password = '';

  /// 当前按钮是否可点击
  bool isButtonEnable() => account.isNotEmpty && password.isNotEmpty;

  /// 用户登录
  login() {
    if (account.isEmpty || password.isEmpty) return;

    // 账户名：> 6位
    if (account.length < 6) {
      ToastUtil.show(account.isEmpty
          ? S.current.registerAccountEmpty
          : S.current.registerAccountLength);
      return;
    }

    // 密码：> 6位
    if (password.length < 6) {
      ToastUtil.show(password.isEmpty
          ? S.current.registerPasswordEmpty
          : S.current.registerPasswordLength);
      return;
    }

    // 登录
    loginRequest.login(account, password, success: (data) {
      ToastUtil.show(S.current.loginSuccess);
      // Get.offAllNamed(AppRoutes.initial);
      Get.back();
      Get.find<MineController>().updateUserinfo();
    });
  }
}
