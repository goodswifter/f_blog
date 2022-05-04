///
/// Author       : zhongaidong
/// Date         : 2022-04-24 12:14:21
/// Description  : 轮播图Widget
///
import 'package:blog/core/base/pages/get_save_state_view.dart';
import 'package:blog/core/resource/color_handler.dart';
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/entity/banner_entity.dart';
import 'package:blog/pages/complex_module/01_home_page/home_controller.dart';
import 'package:blog/utils/web_util.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeBannerWidget extends GetSaveStateView<HomeController> {
  const HomeBannerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int length = controller.banners.length;
    if (length <= 0) return Container();

    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 140,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Swiper(
          itemCount: length,
          itemBuilder: (BuildContext context, int index) {
            BannerEntity banner = controller.banners[index];
            return banner.isAssets
                ? Container(
                    color: ColorHandler.globalYellowColor,
                    child: Image.asset(banner.imagePath),
                  )
                : Image.network(
                    banner.imagePath,
                    fit: BoxFit.fill,
                  );
          },
          onTap: (index) {
            if (index == 0) {
              Get.toNamed(AppRoutes.complexRanking);
            } else {
              WebUtil.toWebPageBanners(controller.banners[index]);
            }
          },
          // 这里是设置PageControl的样式，也就轮播图分页指示器（下面的小点）
          pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              size: 8, // 设置未选中的小点大小
              activeSize: 8, // 设置选中的小点大小
              color: Colors.green, // 设置未选中的小点颜色
              activeColor: Colors.red, // 设置选中的小点颜色
            ),
          ),
          autoplay: true,
        ),
      ),
    );
  }
}
