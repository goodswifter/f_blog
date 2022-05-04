///
/// Author       : zhongaidong
/// Date         : 2022-04-22 22:10:49
/// Description  : 基类分页Getx控制器
/// 分页专用
/// 此页面暂时不对数据进行处理，不放置List在此处，因为当前已经很简洁了，不需要绑定[RefreshWidget]进行节省代码
///
import 'package:blog/widgets/refresh_widget.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_get_controller.dart';

/// 加载状态
enum LoadState {
  /// 加载中
  loading,

  /// 加载成功
  success,

  /// 加载数据为空
  empty,

  /// 加载失败
  error,
}

abstract class BasePageGetController extends BaseGetController {
  /// 加载状态
  var loadState = LoadState.loading.obs;

  /// 当前页数
  int page = 0;

  /// 是否初次加载
  var isInit = true;

  /// 请求数据
  List datas = [];

  /// 刷新控制器
  RefreshController controller = RefreshController();

  /// 加载成功，是否显示空页面
  showSuccess(List success) => loadState.value =
      success.isNotEmpty ? LoadState.success : LoadState.empty;

  /// 加载失败,显示失败页面
  showError() => loadState.value = LoadState.error;

  /// 重新加载
  showLoading() => loadState.value = LoadState.loading;

  /// 预留初次加载，注意只供上拉下拉使用
  initPullLoading(RefreshController controller) {
    if (isInit) {
      this.controller = controller;
      requestData(controller);
    }
  }

  /// 预留上拉刷新
  onLoadRefresh(RefreshController controller) {
    page = 0;
    requestData(controller, refresh: RefreshState.down);
  }

  /// 预留下拉加载
  onLoadMore(RefreshController controller) {
    ++page;
    requestData(controller, refresh: RefreshState.up);
  }

  /// 网络请求在此处进行，不用在重复进行上拉下拉的处理
  void requestData(RefreshController controller,
      {RefreshState refresh = RefreshState.first});
}
