///
/// Author       : zhongaidong
/// Date         : 2022-04-23 09:02:07
/// Description  : 点击波纹效果Widget
///
import 'package:blog/core/resource/color_handler.dart';
import 'package:flutter/material.dart';

class Ripple extends StatelessWidget {
  const Ripple({
    Key? key,
    required this.child,
    this.onTap,
    this.circular = 0,
  }) : super(key: key);

  /// 点击事件
  final GestureTapCallback? onTap;

  /// 圆角大小
  final double circular;

  /// 子组件
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.all(
        Radius.circular(circular),
      ),
      onTap: onTap,
      splashColor: ColorHandler.greyColor7,
      highlightColor: ColorHandler.greyColor7,
      child: child,
    );
  }
}
