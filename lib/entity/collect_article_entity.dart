/// 
/// Author       : zhongaidong
/// Date         : 2022-04-25 19:47:22
/// Description  : 收藏详情实体类
/// 
import 'dart:convert';

CollectArticleEntity collectDetailEntityFromJson(String str) => CollectArticleEntity.fromJson(json.decode(str));

String collectDetailEntityToJson(CollectArticleEntity data) => json.encode(data.toJson());

class CollectArticleEntity {
    CollectArticleEntity({
        this.author = '',
        this.chapterId = 0,
        this.chapterName = '',
        this.courseId = 0,
        this.desc = '',
        this.envelopePic = '',
        this.id = 0,
        this.link = '',
        this.niceDate = '',
        this.origin = '',
        this.originId = 0,
        this.publishTime = 0,
        this.title = '',
        this.userId = 0,
        this.visible = 0,
        this.zan = 0,
    });

    String author;
    int chapterId;
    String chapterName;
    int courseId;
    String desc;
    String envelopePic;
    int id;
    String link;
    String niceDate;
    String origin;
    int originId;
    int publishTime;
    String title;
    int userId;
    int visible;
    int zan;

    factory CollectArticleEntity.fromJson(Map<String, dynamic> json) => CollectArticleEntity(
        author: json["author"],
        chapterId: json["chapterId"],
        chapterName: json["chapterName"],
        courseId: json["courseId"],
        desc: json["desc"],
        envelopePic: json["envelopePic"],
        id: json["id"],
        link: json["link"],
        niceDate: json["niceDate"],
        origin: json["origin"],
        originId: json["originId"],
        publishTime: json["publishTime"],
        title: json["title"],
        userId: json["userId"],
        visible: json["visible"],
        zan: json["zan"],
    );

    Map<String, dynamic> toJson() => {
        "author": author,
        "chapterId": chapterId,
        "chapterName": chapterName,
        "courseId": courseId,
        "desc": desc,
        "envelopePic": envelopePic,
        "id": id,
        "link": link,
        "niceDate": niceDate,
        "origin": origin,
        "originId": originId,
        "publishTime": publishTime,
        "title": title,
        "userId": userId,
        "visible": visible,
        "zan": zan,
    };
}
