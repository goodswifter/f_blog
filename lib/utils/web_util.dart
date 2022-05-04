///
/// Author       : zhongaidong
/// Date         : 2022-04-25 19:31:40
/// Description  : Webview工具类
///
import 'package:blog/core/router/app_routes.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/entity/banner_entity.dart';
import 'package:blog/entity/collect_article_entity.dart';
import 'package:blog/entity/webview_entity.dart';
import 'package:get/get.dart';

import 'sp_util/sp_util.dart';

class WebUtil {
  /// 普通页面进入Web页面1
  static toWebPage(ArticleEntity detail, {Function(bool)? onResult}) {
    Get.toNamed(AppRoutes.webview,
        arguments: WebviewEntity(
          title: detail.title,
          link: detail.link,
          id: detail.id,
          isCollect: detail.collect,
        ))?.then((value) async {
      if (value is bool) onResult?.call(value);
    });

    /// 存储浏览记录
    SpUtil.saveBrowseHistory(detail);
  }

  /// 收藏页面进入Web页面2
  static Future<dynamic>? toWebPageCollect(CollectArticleEntity detail) {
    return Get.toNamed(AppRoutes.webview,
        arguments: WebviewEntity(
          title: detail.title,
          link: detail.link,
          id: detail.id,
          originId: detail.originId,
          isCollect: true,
        ));
  }

  /// 普通页面进入Web页面2
  static toWebPageBanners(BannerEntity detail) {
    Get.toNamed(AppRoutes.webview,
        arguments: WebviewEntity(
          title: detail.title,
          link: detail.url,
          id: 0,
          isCollect: false,
        ));
  }

  /// 其他页面进入Web页面2
  static toWebPageOther({String title = '', String link = ''}) {
    Get.toNamed(
      AppRoutes.webview,
      arguments: WebviewEntity(
        title: title,
        link: link,
        id: 0,
        isCollect: false,
      ),
    );
  }
}
