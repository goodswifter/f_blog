///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:01:03
/// Description  : 个人信息 controller层
///
import 'package:blog/core/base/controller/base_get_controller.dart';
import 'package:blog/utils/sp_util/sp_util.dart';

class PersonalInfoController extends BaseGetController {

  @override
  void onInit() {
    super.onInit();
    var info = SpUtil.getUserinfo();
    if (info != null) {
      userinfo = info;
      update();
    }
  }
}
