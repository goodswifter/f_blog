///
/// Author       : zhongaidong
/// Date         : 2022-04-29 22:13:55
/// Description  : 我的模块请求仓库
///
import 'package:blog/core/http/http_request.dart';
import 'package:blog/core/http/request.dart';
import 'package:blog/core/http/request_api.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/entity/collect_article_entity.dart';
import 'package:blog/entity/point_entity.dart';
import 'package:blog/entity/project_page_entity.dart';
import 'package:blog/utils/function_util.dart';

class MineRequest {
  /// 我收藏的文章列表
  requestCollectArticleList({
    int page = 0,
    SuccessOver<List<CollectArticleEntity>>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
      RequestApi.apiCollectDetail.replaceFirst(RegExp('page'), '$page'),
      dialog: false,
      success: (data) {
        ProjectPageEntity pageData = ProjectPageEntity.fromJson(data);
        var list = pageData.datas.map((value) {
          return CollectArticleEntity.fromJson(value);
        }).toList();
        success?.call(list, pageData.over);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 请求积分详情数据
  requestPointList(
    int page, {
    SuccessOver<List<PointEntity>>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
      RequestApi.apiPoints.replaceFirst(RegExp('page'), '$page'),
      dialog: false,
      success: (data) {
        // 先解析外层分页
        ProjectPageEntity pageData = ProjectPageEntity.fromJson(data);
        // 数组解析
        var list = pageData.datas.map((value) {
          return PointEntity.fromJson(value);
        }).toList();
        success?.call(list, pageData.over);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 请求分享文章列表的个数
  requestShareArticleList({
    int page = 0,
    ParamSingleCallback<int>? length,
    SuccessOver<List<ArticleEntity>>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
      RequestApi.apiShareArticleList.replaceFirst(RegExp('page'), '$page'),
      dialog: false,
      success: (data) {
        ProjectPageEntity pageData =
            ProjectPageEntity.fromJson(data['shareArticles']);
        var list = pageData.datas.map((value) {
          return ArticleEntity.fromJson(value);
        }).toList();
        success?.call(list, pageData.over);
        length?.call(pageData.total);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }
}
