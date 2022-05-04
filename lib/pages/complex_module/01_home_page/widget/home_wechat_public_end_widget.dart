///
/// Author       : zhongaidong
/// Date         : 2022-04-26 12:46:10
/// Description  : 首页 微信公众号右侧侧滑按钮
///
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/shadow_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:flutter/material.dart';

class HomeWechatPublicEndWidget extends StatefulWidget {
  const HomeWechatPublicEndWidget({
    Key? key,
    this.icon,
    this.text = '',
    this.show = false,
    this.onTap,
  }) : super(key: key);

  /// 图标
  final IconData? icon;

  /// 右侧文字
  final String text;

  /// 点击事件
  final GestureTapCallback? onTap;

  /// 是否显示按钮数据
  final bool show;

  @override
  State<HomeWechatPublicEndWidget> createState() =>
      _HomeWechatPublicEndWidgetState();
}

class _HomeWechatPublicEndWidgetState extends State<HomeWechatPublicEndWidget>
    with TickerProviderStateMixin {
  late AnimationController transferController;
  late Animation<Offset> transferAnimation;

  @override
  void initState() {
    super.initState();
    initAnimation(widget.show);
  }

  /// 初始化动画控制器
  initAnimation(bool isFirst, {int milliseconds = 300}) {
    transferController = AnimationController(
        vsync: this, duration: Duration(milliseconds: milliseconds));
    transferAnimation = Tween(begin: Offset.zero, end: const Offset(0.7, 0))
        .animate(transferController);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.show) {
      transferController.reverse();
    } else {
      transferController.forward();
    }
    return SlideTransition(
      position: transferAnimation,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: widget.onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          decoration: ShadowHandler.white12CircleBorder(
              const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              radius: 20),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(widget.icon, size: 14),
              GapHandler.hGap5,
              Text(widget.text, style: TextStyleHandler.styleGrey4Font11),
              GapHandler.hGap10,
            ],
          ),
        ),
      ),
    );
  }
}
