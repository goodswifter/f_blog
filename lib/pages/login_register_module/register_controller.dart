///
/// Author       : zhongaidong
/// Date         : 2022-04-23 23:09:59
/// Description  : 注册 controller层
///
import 'package:blog/core/base/controller/base_get_controller.dart';
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RegisterController extends BaseGetController {
  /// 账号
  String account = "";

  /// 密码
  String password = "";

  /// 确认密码
  String repassword = "";

  /// 是否勾选隐私权限复选框
  bool isCheckPrivacy = true;

  /// 勾选/取消隐私权限复选框
  updateCheck() {
    isCheckPrivacy = !isCheckPrivacy;
    update(["isCheckPrivacy"]);
  }

  /// 当前按钮是否可点击
  bool isButtonEnable() {
    return account.isNotEmpty && password.isNotEmpty && repassword.isNotEmpty;
  }

  /// 点击注册, 注册成功后跳转到主页
  register() {
    if (account.isEmpty || password.isEmpty || repassword.isEmpty) return;

    ///账户名：> 6位
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

    // 确认密码：> 6位
    if (repassword.length < 6) {
      ToastUtil.show(repassword.isEmpty
          ? S.current.registerRePasswordEmpty
          : S.current.registerRePasswordLength);
      return;
    }

    // 密码 == 确认密码
    if (password != repassword) {
      ToastUtil.show(Intl.message(S.current.registerPasswordDiff));
      return;
    }

    // 是否同意服务条款
    if (!isCheckPrivacy) {
      ToastUtil.show(Intl.message(S.current.registerNotServiceTerms));
      return;
    }

    loginRequest.register(
      account: account,
      password: password,
      repassword: repassword,
      success: (data) {
        ToastUtil.show(Intl.message(S.current.registerSuccess));
        Get.offAllNamed(AppRoutes.initial);
      },
    );
  }
}
