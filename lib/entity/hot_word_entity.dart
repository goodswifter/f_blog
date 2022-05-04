///
/// Author       : zhongaidong
/// Date         : 2022-04-27 11:06:39
/// Description  : 搜索热词实体类
///
import 'dart:convert';

HotWordEntity hotWordEntityFromJson(String str) =>
    HotWordEntity.fromJson(json.decode(str));

String hotWordEntityToJson(HotWordEntity data) => json.encode(data.toJson());

class HotWordEntity {
  HotWordEntity({
    this.id = 0,
    this.link = '',
    this.name = '',
    this.order = 0,
    this.visible = 1,
  });

  int id;

  /// 链接
  String link;

  /// 热词名称
  String name;
  int order;
  int visible;

  factory HotWordEntity.fromJson(Map<String, dynamic> json) => HotWordEntity(
        id: json["id"],
        link: json["link"],
        name: json["name"],
        order: json["order"],
        visible: json["visible"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "link": link,
        "name": name,
        "order": order,
        "visible": visible,
      };
}
