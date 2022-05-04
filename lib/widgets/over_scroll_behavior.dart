/// 
/// Author       : zhongaidong
/// Date         : 2022-04-22 20:36:35
/// Description  : 滚动边缘响应行为
/// 
import 'package:flutter/material.dart';

class OverScrollBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    if (getPlatform(context) == TargetPlatform.android || getPlatform(context) == TargetPlatform.fuchsia) {
      return GlowingOverscrollIndicator(
        child: child,
        showLeading: false,
        showTrailing: false,
        axisDirection: axisDirection,
        color: Theme.of(context).colorScheme.secondary,
      );
    } else {
      return child;
    }
  }
}