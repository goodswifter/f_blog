///
/// Author       : zhongaidong
/// Date         : 2022-04-22 12:50:15
/// Description  : 用户信息实体类
/// final userinfoEntity = userinfoEntityFromJson(jsonString);

import 'dart:convert';

UserinfoEntity userinfoEntityFromJson(String str) =>
    UserinfoEntity.fromJson(json.decode(str));

String userinfoEntityToJson(UserinfoEntity data) => json.encode(data.toJson());

class UserinfoEntity {
  UserinfoEntity({
    this.admin = false,
    this.chapterTops = const [],
    this.coinCount = 0,
    this.collectIds = const [],
    this.email = '',
    this.icon = '',
    this.id = 0,
    this.nickname = '',
    this.password = '',
    this.publicName = '',
    this.token = '',
    this.type = 0,
    this.username = '',
  });

  bool admin;
  List<dynamic> chapterTops;
  int coinCount;
  List<int> collectIds;
  String email;
  String icon;
  int id;
  String nickname;
  String password;
  String publicName;
  String token;
  int type;
  String username;

  factory UserinfoEntity.fromJson(Map<String, dynamic> json) => UserinfoEntity(
        admin: json["admin"],
        chapterTops: List<dynamic>.from(json["chapterTops"].map((x) => x)),
        coinCount: json["coinCount"],
        collectIds: List<int>.from(json["collectIds"].map((x) => x)),
        email: json["email"],
        icon: json["icon"],
        id: json["id"],
        nickname: json["nickname"],
        password: json["password"],
        publicName: json["publicName"],
        token: json["token"],
        type: json["type"],
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "admin": admin,
        "chapterTops": List<dynamic>.from(chapterTops.map((x) => x)),
        "coinCount": coinCount,
        "collectIds": List<dynamic>.from(collectIds.map((x) => x)),
        "email": email,
        "icon": icon,
        "id": id,
        "nickname": nickname,
        "password": password,
        "publicName": publicName,
        "token": token,
        "type": type,
        "username": username,
      };
}
