/// 
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:01:03
/// Description  : 积分页面 controller层
/// 
import 'package:blog/core/base/controller/base_page_get_controller.dart';
import 'package:blog/utils/refresh_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class PointController extends BasePageGetController {
  /// 请求积分明细
  @override
  void requestData(RefreshController controller,
      {RefreshState refresh = RefreshState.first}) {
    mineRequest.requestPointList(page, success: (data, over) {
      RefreshUtil.onSuccess(controller, refresh, over);
      // 下拉刷新需要清除列表
      if (refresh != RefreshState.up) {
        datas.clear();
      }
      datas.addAll(data);
      showSuccess(datas);
      update();
    }, fail: (code, msg) {
      showError();
      RefreshUtil.onError(controller, refresh);
    });
  }
}