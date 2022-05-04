/// 
/// Author       : zhongaidong
/// Date         : 2022-05-02 19:50:59
/// Description  : 积分实体类
/// 
import 'dart:convert';

PointEntity pointEntityFromJson(String str) => PointEntity.fromJson(json.decode(str));

String pointEntityToJson(PointEntity data) => json.encode(data.toJson());

class PointEntity {
    PointEntity({
        this.coinCount = 0,
        this.date = 0,
        this.desc = '',
        this.id = 0,
        this.reason = '',
        this.type = 0,
        this.userId = 0,
        this.userName = '',
    });

    int coinCount;
    int date;
    String desc;
    int id;
    String reason;
    int type;
    int userId;
    String userName;

    factory PointEntity.fromJson(Map<String, dynamic> json) => PointEntity(
        coinCount: json["coinCount"],
        date: json["date"],
        desc: json["desc"],
        id: json["id"],
        reason: json["reason"],
        type: json["type"],
        userId: json["userId"],
        userName: json["userName"],
    );

    Map<String, dynamic> toJson() => {
        "coinCount": coinCount,
        "date": date,
        "desc": desc,
        "id": id,
        "reason": reason,
        "type": type,
        "userId": userId,
        "userName": userName,
    };
}
