///
/// Author       : zhongaidong
/// Date         : 2022-04-29 23:29:34
/// Description  : 弹窗基类
///
import 'package:blog/widgets/over_scroll_behavior.dart';
import 'package:flutter/material.dart';

class BaseDialogWidget extends StatefulWidget {
  const BaseDialogWidget({
    Key? key,
    required this.child,
    this.shape = 10,
    this.horizontal = 25,
  }) : super(key: key);

  /// child
  final Widget child;

  /// 圆角
  final double shape;

  /// 左右边距
  final double horizontal;

  @override
  State<BaseDialogWidget> createState() => _BaseDialogWidgetState();
}

class _BaseDialogWidgetState extends State<BaseDialogWidget>
    with TickerProviderStateMixin {
  /// 动画加载控制器
  late AnimationController scaleController;
  late Animation<double> scaleAnimation;

  /// 初始化动画控制器
  @override
  void initState() {
    super.initState();
    scaleController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 360));
    scaleAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: scaleController, curve: Curves.easeIn));
  }

  @override
  Widget build(BuildContext context) {
    scaleController.forward();
    return Material(
      type: MaterialType.transparency, // 透明样式
      // dialog居中
      child: Center(
        // 取消ListView滑动阴影
        child: ScrollConfiguration(
          behavior: OverScrollBehavior(),
          // ListView 的shrinkWrap属性可适应高度（有多少占多少）
          child: ScaleTransition(
            alignment: Alignment.center,
            scale: scaleController,
            child: ListView(
              shrinkWrap: true,
              children: [
                // 背景及内容、边距、圆角等，必须包裹在ListView中
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(horizontal: widget.horizontal),
                  child: Container(
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(widget.shape),
                        ),
                      ),
                    ),
                    child: widget.child,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    scaleController.dispose();
    super.dispose();
  }
}
