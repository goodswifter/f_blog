///
/// Author       : zhongaidong
/// Date         : 2022-04-25 18:27:52
/// Description  : Wevview view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/core/resource/text_style_handler.dart';
import 'webview_controller.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'widget/webview_bottom_widget.dart';

class WebviewPage extends GetCommonView<WebviewController> {
  const WebviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          /// 拦截用户返回，返回时携带参数
          Get.back(result: controller.isCollect.value);
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
              CustomAppBar(
                backColor: ColorHandler.greyColor1,
                backOnTap: () => Get.back(result: controller.isCollect.value),
                title: controller.detail.title,
                titleStyle: TextStyleHandler.titleBlackTextStyle,
                endWidget: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    splashColor: ColorHandler.greyColor5,
                    onTap: () => Share.share(
                        controller.detail.title + controller.detail.link),
                    child: SvgPicture.asset(
                      R.assetsSvgShareSvg,
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    WebView(
                      initialUrl: controller.detail.link,
                      javascriptMode: JavascriptMode.unrestricted,
                      onProgress: (pro) {
                        controller.progress.value = (pro / 100).toDouble();
                      },
                    ),
                    Obx(() => Visibility(
                          visible: controller.collectAtState.value,
                          child: Positioned.fill(
                            child: Lottie.asset(
                              R.assetsLottieCollectSuccessJson,
                              animate: controller.collectAtState.value,
                            ),
                          ),
                        )),
                    Obx(() => Visibility(
                          visible: controller.progress < 1,
                          child: LinearProgressIndicator(
                            minHeight: 2,
                            backgroundColor: ColorHandler.whiteColor1,
                            color: ColorHandler.globalGreenColor,
                            value: controller.progress.value,
                          ),
                        )),
                  ],
                ),
              ),
              Visibility(
                visible: controller.detail.id > 0,
                child: const WebviewBottomWidget(),
              ),
            ],
          ),
        ));
  }
}
