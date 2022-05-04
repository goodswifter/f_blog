///
/// Author       : zhongaidong
/// Date         : 2022-04-26 11:59:25
/// Description  :
///
import 'dart:convert';

WechatPublicEntity wechatPublicEntityFromJson(String str) =>
    WechatPublicEntity.fromJson(json.decode(str));

String wechatPublicEntityToJson(WechatPublicEntity data) =>
    json.encode(data.toJson());

class WechatPublicEntity {
  WechatPublicEntity({
    this.author = '',
    this.children = const [],
    this.courseId = 0,
    this.cover = '',
    this.desc = '',
    this.id = 0,
    this.lisense = '',
    this.lisenseLink = '',
    this.name = '',
    this.order = 0,
    this.parentChapterId = 0,
    this.userControlSetTop = false,
    this.visible = 1,
  });

  /// 公众号ID
  int courseId;

  /// ID
  int id;

  /// 是否显示
  int order;

  /// 类型
  int visible;

  /// 公众号名称
  String name;

  /// 公众号名称
  int parentChapterId;

  /// 是否置顶
  bool userControlSetTop;

  /// 子类
  List children;

  String author;
  String cover;
  String desc;
  String lisense;
  String lisenseLink;

  factory WechatPublicEntity.fromJson(Map<String, dynamic> json) =>
      WechatPublicEntity(
        author: json["author"],
        children: List<dynamic>.from(json["children"].map((x) => x)),
        courseId: json["courseId"],
        cover: json["cover"],
        desc: json["desc"],
        id: json["id"],
        lisense: json["lisense"],
        lisenseLink: json["lisenseLink"],
        name: json["name"],
        order: json["order"],
        parentChapterId: json["parentChapterId"],
        userControlSetTop: json["userControlSetTop"],
        visible: json["visible"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "children": List<dynamic>.from(children.map((x) => x)),
        "courseId": courseId,
        "cover": cover,
        "desc": desc,
        "id": id,
        "lisense": lisense,
        "lisenseLink": lisenseLink,
        "name": name,
        "order": order,
        "parentChapterId": parentChapterId,
        "userControlSetTop": userControlSetTop,
        "visible": visible,
      };
}
