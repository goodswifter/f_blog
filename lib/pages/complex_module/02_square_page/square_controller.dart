///
/// Author       : zhongaidong
/// Date         : 2022-04-23 07:11:39
/// Description  : 广场 controller层
///
import 'package:blog/core/base/controller/base_page_get_controller.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/utils/refresh_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SquareController extends BasePageGetController {
  @override
  void requestData(RefreshController controller,
      {RefreshState refresh = RefreshState.first}) {
    complexRequest.requestSquareData(
        page: page,
        success: (data, over) {
          RefreshUtil.onSuccess(controller, refresh, over);

          // 初次加载和下拉刷新需要清除列表
          if (refresh != RefreshState.up) datas.clear();

          datas.addAll(data);
          showSuccess(datas);
          update();
        },
        fail: (code, msg) {
          showError();
          RefreshUtil.onError(controller, refresh);
        });
  }
}
