///
/// Author       : zhongaidong
/// Date         : 2022-04-25 18:28:31
/// Description  :
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/gap_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/shadow_handler.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/navigator_util.dart';
import 'package:blog/utils/toast_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../webview_controller.dart';

class WebviewBottomWidget extends GetCommonView<WebviewController> {
  const WebviewBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            GapHandler.hGap20,
            Expanded(
                child: GestureDetector(
              onTap: () => ToastUtil.show(S.of(context).webNotComment),
              child: Container(
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    S.of(context).webEditHint,
                    style: TextStyleHandler.styleGrey14,
                  ),
                  decoration: const BoxDecoration(
                    color: ColorHandler.shadowColor,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  )),
            )),
            GapHandler.hGap20,
            InkWell(
              onTap: () {
                if (controller.isLogin) {
                  controller.collectArticle();
                } else {
                  ToastUtil.show(S.of(context).loginTip);
                }
              },
              child: Obx(() => SvgPicture.asset(
                    controller.isCollect.value
                        ? R.assetsSvgCollectSvg
                        : R.assetsSvgCollectQuitSvg,
                    width: 24,
                  )),
            ),
            GapHandler.hGap20,
            InkWell(
                onTap: () => ToastUtil.show(S.of(context).notSupportLikes),
                child: const Icon(
                  Icons.thumb_up_alt_outlined,
                  color: ColorHandler.globalGreenColor,
                  size: 24,
                )),
            GapHandler.hGap20,
            InkWell(
              onTap: () =>
                  NavigatorUtil.launchInBrowser(controller.detail.link),
              child: const Icon(
                Icons.public,
                color: Colors.blue,
                size: 24,
              ),
            ),
            GapHandler.hGap20,
          ],
        ),
      ),
      decoration: ShadowHandler.white12Circle(radius: 5),
    );
  }
}
