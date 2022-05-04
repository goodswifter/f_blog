///
/// Author       : zhongaidong
/// Date         : 2022-04-25 22:33:49
/// Description  : 积分排行榜实体类
///
import 'dart:convert';

RankingEntity rankingEntityFromJson(String str) =>
    RankingEntity.fromJson(json.decode(str));

String rankingEntityToJson(RankingEntity data) => json.encode(data.toJson());

class RankingEntity {
  RankingEntity({
    this.coinCount = 0,
    this.level = 0,
    this.nickname = '',
    this.rank = '',
    this.userId = 0,
    this.username = '',
  });

  int coinCount;
  int level;
  String nickname;
  String rank;
  int userId;
  String username;

  static fromJson(Map<String, dynamic> json) {
    return RankingEntity(
      coinCount: json['coinCount'],
      level: json['level'],
      nickname: json['nickname'],
      rank: json['rank'],
      userId: json['userId'],
      username: json['username'],
    );
  }

  // factory RankingEntity.fromJson(Map<String, dynamic> json) => RankingEntity(
  //       coinCount: json["coinCount"],
  //       level: json["level"],
  //       nickname: json["nickname"],
  //       rank: json["rank"],
  //       userId: json["userId"],
  //       username: json["username"],
  //     );
  
  Map<String, dynamic> toJson() => {
        "coinCount": coinCount,
        "level": level,
        "nickname": nickname,
        "rank": rank,
        "userId": userId,
        "username": username,
      };
}
