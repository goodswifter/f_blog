///
/// Author       : zhongaidong
/// Date         : 2022-04-24 11:01:53
/// Description  : 综合模块请求仓库
///
import 'package:blog/core/http/http_request.dart';
import 'package:blog/core/http/request.dart';
import 'package:blog/core/http/request_api.dart';
import 'package:blog/entity/banner_entity.dart';
import 'package:blog/entity/hot_word_entity.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/entity/project_page_entity.dart';
import 'package:blog/entity/ranking_entity.dart';
import 'package:blog/entity/wechat_public_entity.dart';

class ComplexRequest {
  /// 获取首页Banner
  getBanners({
    Success<List<BannerEntity>>? success,
    Fail? fail,
  }) {
    Request.get<List>(
      RequestApi.apiBanner,
      dialog: false,
      success: (data) {
        var banners = List<BannerEntity>.from(
            data.map((item) => BannerEntity.fromJson(item)));
        success?.call(banners);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 收藏 | 取消收藏文章 接口
  collectArticle(
    int id, {
    bool isCollect = false,
    Success<bool>? success,
    Fail? fail,
  }) {
    var api = isCollect ? RequestApi.apiUnCollect : RequestApi.apiCollect;
    Request.post(
      api.replaceFirst(RegExp('id'), '$id'),
      dialog: false,
      success: (data) => success?.call(true),
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 请求积分排行榜接口
  rankingPoints(
    int page, {
    SuccessOver<List<RankingEntity>>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
      RequestApi.apiRanking.replaceFirst(RegExp('page'), '$page'),
      dialog: false,
      success: (data) {
        /// 先解析外层分页
        ProjectPageEntity pageData = ProjectPageEntity.fromJson(data);

        /// 数组解析
        var list = pageData.datas.map<RankingEntity>((value) {
          return RankingEntity.fromJson(value);
        }).toList();
        success?.call(list, pageData.over);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 请求首页文章列表接口
  requestHomeArticle({
    int page = 0,
    SuccessOver<List<ArticleEntity>>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
      RequestApi.apiHomeArticle.replaceFirst('page', '$page'),
      dialog: false,
      success: (data) {
        ProjectPageEntity pageData = ProjectPageEntity.fromJson(data);
        var list = pageData.datas.map<ArticleEntity>((value) {
          return ArticleEntity.fromJson(value);
        }).toList();
        return success?.call(list, pageData.over);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 获取微信公众号列表
  getWechatPublic({
    Success<List<WechatPublicEntity>>? success,
    Fail? fail,
  }) {
    Request.get<List<dynamic>>(
      RequestApi.apiWechatPublic,
      dialog: false,
      success: (data) {
        var list = data.map((value) {
          return WechatPublicEntity.fromJson(value);
        }).toList();
        success?.call(list);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 获取搜索热词
  getSearchHotWord({
    Success<List<HotWordEntity>>? success,
    Fail? fail,
  }) {
    Request.get<List>(
      RequestApi.apiHotWord,
      dialog: false,
      success: (data) => success?.call(
        data.map((value) => HotWordEntity.fromJson(value)).toList(),
      ),
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 根据关键词搜索文章
  /// [page]当前页码
  /// [keyword] 当前热词
  /// [success] 请求成功回调
  /// [fail] 请求失败回调
  searchArticleByKeyWord({
    int page = 0,
    String keyword = '',
    SuccessOver<List<ArticleEntity>>? success,
    Fail? fail,
  }) {
    Request.post<Map<String, dynamic>>(
      RequestApi.apiSearchWord.replaceFirst(RegExp('page'), '$page'),
      params: {"k": keyword},
      dialog: false,
      success: (data) {
        if (success != null) {
          ProjectPageEntity pageData = ProjectPageEntity.fromJson(data);
          List<ArticleEntity>? projects = pageData.datas
              .map((value) => ArticleEntity.fromJson(value))
              .toList();
          success.call(projects, pageData.over);
        }
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 请求广场列表接口
  requestSquareData({
    int page = 0,
    SuccessOver<List<ArticleEntity>>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
      RequestApi.apiSquare.replaceFirst(RegExp('page'), page.toString()),
      dialog: false,
      success: (data) {
        if (success != null) {
          ProjectPageEntity pageData = ProjectPageEntity.fromJson(data);
          List<ArticleEntity>? projects = pageData.datas
              .map((value) => ArticleEntity.fromJson(value))
              .toList();
          success.call(projects, pageData.over);
        }
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }

  /// 请求广场列表接口
  requestAskData({
    int page = 0,
    SuccessOver<List<ArticleEntity>>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
      RequestApi.apiAsk.replaceFirst(RegExp('page'), page.toString()),
      dialog: false,
      success: (data) {
        if (success != null) {
          ProjectPageEntity pageData = ProjectPageEntity.fromJson(data);
          List<ArticleEntity>? projects = pageData.datas
              .map((value) => ArticleEntity.fromJson(value))
              .toList();
          success.call(projects, pageData.over);
        }
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }
}
