///
/// Author       : zhongaidong
/// Date         : 2022-04-24 11:26:35
/// Description  : 项目分页实体类
///
import 'dart:convert';

ProjectPageEntity projectDetailEntityFromJson(String str) =>
    ProjectPageEntity.fromJson(json.decode(str));

String projectDetailEntityToJson(ProjectPageEntity data) =>
    json.encode(data.toJson());

class ProjectPageEntity {
  ProjectPageEntity({
    this.curPage = 0,
    this.datas = const [],
    this.offset = 0,
    this.over = false,
    this.pageCount = 0,
    this.size = 0,
    this.total = 0,
  });

  /// 当前页数
  int curPage;

  /// 数据
  List datas;

  /// 偏移
  int offset;

  /// 是否为最后一页
  bool over;

  /// 页数长度
  int pageCount;

  /// 当前页大小
  int size;

  /// 数据总大小
  int total;

  factory ProjectPageEntity.fromJson(Map json) =>
      ProjectPageEntity(
        curPage: json["curPage"],
        datas: json['datas'],
        offset: json["offset"],
        over: json["over"],
        pageCount: json["pageCount"],
        size: json["size"],
        total: json["total"],
      );

  Map<String, dynamic> toJson() => {
        "curPage": curPage,
        "datas": datas,
        "offset": offset,
        "over": over,
        "pageCount": pageCount,
        "size": size,
        "total": total,
      };
}
