///
/// Author       : zhongaidong
/// Date         : 2022-04-23 07:09:01
/// Description  : 问答控制器
///
import 'package:blog/core/base/controller/base_page_get_controller.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/utils/refresh_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AskController extends BasePageGetController {
  @override
  void requestData(RefreshController controller,
      {RefreshState refresh = RefreshState.first}) {
    complexRequest.requestAskData(
        page: page,
        success: (data, over) {
          RefreshUtil.onSuccess(controller, refresh, over);

          // 初次加载和下拉刷新需要清除列表
          if (refresh != RefreshState.up) datas.clear();

        List temps = [];
        for (var i = 0; i < data.length; i++) {
          ArticleEntity article = data[i];
          if (article.title.contains('Android') ||
              article.desc.contains('Android') ||
              article.shareUser.contains('Android') ||
              article.author.contains('Android') ||
              article.title.contains('android') ||
              article.desc.contains('android') ||
              article.shareUser.contains('android') ||
              article.author.contains('android')) continue;
          temps.add(article);
        }

          datas.addAll(temps);
          showSuccess(datas);
          update();
        },
        fail: (code, msg) {
          showError();
          RefreshUtil.onError(controller, refresh);
        });
  }
}
