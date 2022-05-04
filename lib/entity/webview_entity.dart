///
/// Author       : zhongaidong
/// Date         : 2022-04-25 18:30:44
/// Description  : Webview实体类
///

class WebviewEntity {
  WebviewEntity({
    this.title = '',
    this.link = '',
    this.id = 0,
    this.isCollect = false,
    this.originId = 0,
  });

  /// 标题
  String title;

  /// 链接
  String link;

  /// ID
  int id;

  /// 取消收藏专用此字段
  int originId;

  /// 是否收藏
  bool isCollect;
}
