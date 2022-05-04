///
/// Author       : zhongaidong
/// Date         : 2022-04-23 18:17:13
/// Description  : 启动页 View层
///
import 'package:blog/core/resource/r.dart';
import 'package:blog/utils/screen_util.dart';
import 'package:flutter/material.dart';

import 'widget/splash_animate_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 去除状态栏半透明
    ScreenUtil.removeSystemTransparent(context);

    // 预缓存背景图片
    precacheImage(const AssetImage(R.assetsImagesBgLoginPng), context);

    return const Scaffold(
      body: SplashAnimateWidget(),
    );
  }
}
