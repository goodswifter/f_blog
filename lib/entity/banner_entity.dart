///
/// Author       : zhongaidong
/// Date         : 2022-04-24 10:50:34
/// Description  : 轮播图实体类
///

import 'dart:convert';

List<BannerEntity> bannerEntityFromJson(String str) => List<BannerEntity>.from(
    json.decode(str).map((x) => BannerEntity.fromJson(x)));

String bannerEntityToJson(List<BannerEntity> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BannerEntity {
  BannerEntity({
    this.desc = '',
    this.id = 0,
    this.imagePath = '',
    this.isVisible = true,
    this.order = 0,
    this.title = '',
    this.type = 0,
    this.url = '',
    this.isAssets = false,
  });

  /// 描述
  String desc;

  /// ID
  int id;

  /// 图片路径
  String imagePath;

  /// 是否显示
  bool isVisible;
  int order;

  /// 标题
  String title;

  /// 类型
  int type;

  /// 对应链接
  String url;

  /// 是否为本地图片
  bool isAssets;

  factory BannerEntity.fromJson(Map<String, dynamic> json) => BannerEntity(
        desc: json['desc'],
        id: json['id'],
        imagePath: json['imagePath'],
        isVisible: json['isVisible'] == 1 ? true : false,
        order: json['order'],
        title: json['title'],
        type: json['type'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'desc': desc,
        'id': id,
        'imagePath': imagePath,
        'isVisible': isVisible,
        'order': order,
        'title': title,
        'type': type,
        'url': url,
      };
}
