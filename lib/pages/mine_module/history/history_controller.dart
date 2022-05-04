///
/// Author       : zhongaidong
/// Date         : 2022-04-26 22:01:03
/// Description  : 历史页面 controller层
///
import 'package:blog/core/base/controller/base_page_get_controller.dart';
import 'package:blog/core/http/http_request.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/utils/refresh_util.dart';
import 'package:blog/utils/sp_util/sp_util.dart';
import 'package:blog/widgets/refresh_widget.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HistoryController extends BasePageGetController {
  /// 历史记录
  List<ArticleEntity> _allHistories = [];

  @override
  void onInit() {
    super.onInit();
    _allHistories = SpUtil.getBrowseHistoryModel();
  }

  @override
  void requestData(RefreshController controller,
      {RefreshState refresh = RefreshState.first}) {
    Future.delayed(const Duration(milliseconds: 10), () {
      requestHistoryArticleList(
          page: page,
          success: (data, over) {
            RefreshUtil.onSuccess(controller, refresh, over);

            // 下拉刷新需要清除列表
            if (refresh != RefreshState.up) datas.clear();

            datas.addAll(data);
            showSuccess(datas);
            update();
          });
    });
  }

  /// 请求历史文章文章列表的个数
  requestHistoryArticleList({
    int page = 0,
    int pageSize = 10,
    SuccessOver<List<ArticleEntity>>? success,
  }) {
    int count = _allHistories.length;
    bool over = count <= (page + 1) * pageSize;
    var list = <ArticleEntity>[];
    if (over) {
      list = _allHistories.sublist(page * pageSize);
    } else {
      list = _allHistories.sublist(page * pageSize, (page + 1) * pageSize);
    }
    success?.call(list, over);
  }
}
