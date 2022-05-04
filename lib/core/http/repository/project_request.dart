///
/// Author       : zhongaidong
/// Date         : 2022-04-29 21:34:05
/// Description  : 项目模块请求仓库
///
import 'package:blog/core/http/http_request.dart';
import 'package:blog/core/http/request.dart';
import 'package:blog/core/http/request_api.dart';
import 'package:blog/entity/article_entity.dart';
import 'package:blog/entity/project_page_entity.dart';

class ProjectRequest {
  /// 请求项目列表接口
  requestProjectListData({
    int page = 0,
    SuccessOver<List<ArticleEntity>>? success,
    Fail? fail,
  }) {
    Request.get<dynamic>(
      RequestApi.apiProject.replaceFirst(RegExp('page'), '$page'),
      dialog: false,
      success: (data) {
        ProjectPageEntity pageData = ProjectPageEntity.fromJson(data);
        var list = pageData.datas.map((value) {
          return ArticleEntity.fromJson(value);
        }).toList();
        success?.call(list, pageData.over);
      },
      fail: (code, msg) => fail?.call(code, msg),
    );
  }
}
