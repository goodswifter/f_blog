///
/// Author       : zhongaidong
/// Date         : 2022-04-22 22:01:04
/// Description  : 页面包活, 懒加载 + 缓存
///   Tab切换每次重新拉取数据, 体验极差
///
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class GetSaveStateView<T extends GetxController>
    extends StatefulWidget {
  const GetSaveStateView({Key? key}) : super(key: key);

  final String? tag = null;

  T get controller => GetInstance().find<T>(tag: tag);

  /// 局部更新字段
  get updateId => null;

  /// widget生命周期
  get lifecycle => null;

  @protected
  Widget build(BuildContext context);

  @override
  State<GetSaveStateView> createState() => _GetSaveStateViewState<T>();
}

class _GetSaveStateViewState<S extends GetxController>
    extends State<GetSaveStateView> with AutomaticKeepAliveClientMixin, WidgetsBindingObserver {
  _GetSaveStateViewState();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<S>(
        id: widget.updateId,
        builder: (controller) {
          return widget.build(context);
        });
  }

  @override
  void initState() {
    super.initState();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance?.addObserver(this);
    }
  }

  @override
  void dispose() {
    Get.delete<S>();
    if (widget.lifecycle != null) {
      WidgetsBinding.instance?.removeObserver(this);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (widget.lifecycle != null) {
      widget.lifecycle(state);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
