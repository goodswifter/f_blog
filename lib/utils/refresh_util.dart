///
/// Author       : zhongaidong
/// Date         : 2022-04-25 23:10:41
/// Description  : 刷新工具类
///
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class RefreshUtil {
  /// 刷新加载失败
  /// [controller] RefreshController
  /// [refresh] 加载类型 第一次、上拉、下拉
  static onError(RefreshController controller, RefreshState refresh) {
    if (refresh == RefreshState.down) {
      controller.refreshFailed();
    } else if (refresh == RefreshState.up) {
      controller.loadFailed();
    }
  }

  /// 刷新加载成功
  /// [controller] RefreshController
  /// [refresh] 加载类型 第一次、上拉、下拉
  /// [over] 是否为最后一页
  static onSuccess(
      RefreshController controller, RefreshState refresh, bool over) {
    /// 加载成功，重置刷新状态
    if (refresh == RefreshState.down) {
      controller.refreshCompleted();
    } else if (refresh == RefreshState.up) {
      controller.loadComplete();
    }

    /// 最后一页了，无更多数据
    if (over) {
      controller.loadNoData();
    } else {
      controller.loadComplete();
    }
    if (refresh == RefreshState.down) {
      ToastUtil.show(S.current.pointsNotifySuccess);
    }
  }
}
