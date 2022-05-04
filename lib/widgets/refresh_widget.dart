///
/// Author       : zhongaidong
/// Date         : 2022-04-22 22:22:50
/// Description  : 上拉刷新、下拉加载、空白页加载动画
/// 通过在基类BaseGetController中维护上拉刷新、下拉加载、控制器等等状态
/// 不需要暴露给使用者，当然，此方法只能使用Getx框架有效
///
import 'package:blog/core/base/controller/base_page_get_controller.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'over_scroll_behavior.dart';

/// 刷新状态
enum RefreshState {
  /// 初次进入页面加载
  first,

  /// 上拉加载
  up,

  /// 下拉刷新
  down,
}

class RefreshWidget<T extends BasePageGetController> extends StatefulWidget {
  const RefreshWidget({
    Key? key,
    this.enablePullUp = true,
    this.enablePullDown = true,
    this.onRefresh,
    this.onLoadMore,
    required this.child,
  }) : super(key: key);

  final String? tag = null;

  /// 获取BaseGetController子类对象，在GetX中，任何BaseGetController都可以通过此方法获取
  /// 但是必须是没有dispose的Controller
  T get getController => GetInstance().find<T>(tag: tag);

  /// 是否启用上拉
  final bool enablePullUp;

  /// 是否启用下拉
  final bool enablePullDown;

  /// 下拉刷新回调
  final VoidCallback? onRefresh;

  /// 上拉加载回调
  final VoidCallback? onLoadMore;

  /// 子类，必须是ListView
  final Widget child;

  @override
  State<RefreshWidget> createState() => _RefreshWidgetState();
}

class _RefreshWidgetState extends State<RefreshWidget>
    with AutomaticKeepAliveClientMixin {
  /// 内部维护[RefreshController] ，不暴露出去 , 上下刷新控制器
  RefreshController controller = RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    widget.getController.initPullLoading(controller);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // 上下刷新、下拉加载控件
          Obx(
            () => Visibility(
              visible:
                  widget.getController.loadState.value == LoadState.success,
              child: ScrollConfiguration(
                behavior: OverScrollBehavior(),
                child: SmartRefresher(
                  controller: controller,
                  enablePullDown: widget.enablePullDown,
                  enablePullUp: widget.enablePullUp,
                  onRefresh: () =>
                      widget.getController.onLoadRefresh(controller),
                  onLoading: () => widget.getController.onLoadMore(controller),
                  header: WaterDropHeader(
                    refresh: Lottie.asset(R.assetsLottieRefreshHeadLoadingJson,
                        width: 100, animate: true),
                  ),
                  // header: CustomHeader(
                  //   builder: (BuildContext context, RefreshStatus? mode) {
                  //     Widget header;
                  //     if (mode == RefreshStatus.idle) {
                  //       // 下拉时显示
                  //       header = Text(
                  //         S.of(context).refreshHeaderIdle,
                  //         style: TextStyleHandler.styleGrey14,
                  //       );
                  //     } else if (mode == RefreshStatus.refreshing) {
                  //       // 加载中
                  //       header = Lottie.asset(
                  //           R.assetsLottieRefreshHeadLoadingJson,
                  //           width: 100,
                  //           animate: true);
                  //     } else if (mode == RefreshStatus.failed) {
                  //       // 加载失败
                  //       header = Text(
                  //         S.of(context).refreshHeaderFailed,
                  //         style: TextStyleHandler.styleGrey14,
                  //       );
                  //     } else if (mode == RefreshStatus.completed) {
                  //       // 加载成功
                  //       header = Text(
                  //         S.of(context).refreshHeaderSuccess,
                  //         style: TextStyleHandler.styleGrey14,
                  //       );
                  //     } else {
                  //       // 超过二层
                  //       header = Text(
                  //         S.of(context).refreshHeaderFreed,
                  //         style: TextStyleHandler.styleGrey14,
                  //       );
                  //     }
                  //     return SizedBox(
                  //       height: 64,
                  //       child: Center(child: header),
                  //     );
                  //   },
                  // ),
                  footer: CustomFooter(
                    builder: (BuildContext context, LoadStatus? mode) {
                      Widget footer;
                      if (mode == LoadStatus.idle) {
                        // 下拉提示
                        footer = Text(
                          S.of(context).refreshPull,
                          style: TextStyleHandler.styleGrey14,
                        );
                      } else if (mode == LoadStatus.loading) {
                        // 加载中
                        footer = Lottie.asset(R.assetsLottieRefreshFooterJson,
                            width: 200, animate: true);
                      } else if (mode == LoadStatus.failed) {
                        // 加载失败
                        footer = Text(
                          S.of(context).refreshError,
                          style: TextStyleHandler.styleGrey14,
                        );
                      } else if (mode == LoadStatus.noMore) {
                        // 无更多数据
                        footer = Text(
                          S.of(context).refreshNoData,
                          style: TextStyleHandler.styleGrey14,
                        );
                      } else {
                        // 超过二层
                        footer = Text(
                          S.of(context).refreshHeaderFreed,
                          style: TextStyleHandler.styleGrey14,
                        );
                      }
                      return SizedBox(
                        height: 60,
                        child: Center(child: footer),
                      );
                    },
                  ),
                  child: widget.child,
                ),
              ),
            ),
          ),

          // 未加载前显示的动画，加载之后需要隐藏
          Obx(
            () => Visibility(
              visible:
                  widget.getController.loadState.value == LoadState.loading,
              child: SizedBox(
                width: 200,
                height: 200,
                child: Lottie.asset(R.assetsLottiePageLoadingAnimJson,
                    width: 200, height: 200, animate: true),
              ),
            ),
          ),

          // 加载数据为空的页面
          Obx(
            () => Visibility(
              visible: widget.getController.loadState.value == LoadState.empty,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(R.assetsLottieRefreshEmptyPageJson,
                      width: 200, animate: true, repeat: false),
                  Text(
                    S.of(context).refreshEmpty,
                    style: TextStyleHandler.styleGrey13,
                  )
                ],
              ),
            ),
          ),

          // 加载出错的页面
          Obx(() => Visibility(
                visible:
                    widget.getController.loadState.value == LoadState.error,
                child: Lottie.asset(
                  R.assetsLottieRefreshErrorJson,
                  width: 200,
                  animate: true,
                ),
              )),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
