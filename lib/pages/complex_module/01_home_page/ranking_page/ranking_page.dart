///
/// Author       : zhongaidong
/// Date         : 2022-04-25 22:15:56
/// Description  : 积分排行榜 view层
///
import 'package:blog/core/base/pages/get_common_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/resource/r.dart';
import 'package:blog/pages/complex_module/01_home_page/ranking_page/ranking_controller.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widget/ranking_item_widget.dart';
import '../widget/ranking_title_widget.dart';

class RankingPage extends GetCommonView<RankingController> {
  const RankingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHandler.globalYellowColor,
      body: Column(
        children: [
          CustomAppBar(
              backgroundColor: Colors.transparent,
              backColor: Colors.white,
              backOnTap: () => Get.back()),
          Image.asset(R.assetsImagesRankingIntegralPng),
          Expanded(
            // 排行榜样式
            child: Container(
              margin: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 50),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1.5),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  // 顶部背景标题
                  const RankingTitleWidget(),

                  // 列表
                  Expanded(
                    child: RefreshWidget<RankingController>(
                      enablePullDown: false,
                      child: ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemCount: controller.datas.length,
                        itemBuilder: (BuildContext context, int index) {
                          return RankingItemWidget(
                            ranking: controller.datas[index],
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
