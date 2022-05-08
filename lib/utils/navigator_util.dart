///
/// Author       : zhongaidong
/// Date         : 2022-04-25 19:03:56
/// Description  : 导航栏工具类
///
import 'package:blog/entity/userinfo_entity.dart';
import 'package:blog/utils/sp_util/sp_util.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../generated/l10n.dart';

class NavigatorUtil {
  /// 打开浏览器[url]链接
  static Future launchInBrowser(String url) async {
    Uri _url = Uri.parse(url);
    if (await canLaunchUrl(_url)) {
      await launchUrl(_url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// 登录后跳转
  static void gotoNamed(String routeName) {
    UserinfoEntity? userinfo = SpUtil.getUserinfo();
    if (userinfo == null) {
      ToastUtil.show(S.current.loginTip);
    } else {
      Get.toNamed(routeName);
    }
  }
}
