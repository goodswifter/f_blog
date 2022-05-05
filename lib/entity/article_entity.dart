///
/// Author       : zhongaidong
/// Date         : 2022-04-24 11:31:58
/// Description  :
///
import 'dart:convert';

ArticleEntity projectDetailEntityFromJson(String str) =>
    ArticleEntity.fromJson(json.decode(str));

String? projectDetailEntityToJson(ArticleEntity data) =>
    json.encode(data.toJson());

class ArticleEntity {
  ArticleEntity({
    this.apkLink = '',
    this.audit = 1,
    this.author = '',
    this.canEdit = false,
    this.chapterId = 0,
    this.chapterName = '',
    this.collect = false,
    this.courseId = 0,
    this.desc = '',
    this.descMd = '',
    this.envelopePic = '',
    this.fresh = false,
    this.host = '',
    this.id = 0,
    this.link = '',
    this.niceDate = '',
    this.niceShareDate = '',
    this.origin = '',
    this.prefix = '',
    this.projectLink = '',
    this.publishTime = 0,
    this.realSuperChapterId = 0,
    this.selfVisible = 0,
    this.shareDate = 0,
    this.shareUser = '',
    this.superChapterId = 0,
    this.superChapterName = '',
    this.tags = const [],
    this.title = '',
    this.type = 0,
    this.userId = 0,
    this.visible = 1,
    this.zan = 0,
  });

  String apkLink;
  int audit;
  String author;
  bool canEdit;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  String descMd;
  String envelopePic;
  bool fresh;
  String host;
  int id;
  String link;
  String niceDate;
  String niceShareDate;
  String origin;
  String prefix;
  String projectLink;
  int publishTime;
  int realSuperChapterId;
  int selfVisible;
  int shareDate;
  String shareUser;
  int superChapterId;
  String superChapterName;
  List<Tag> tags;
  String title;
  int type;
  int userId;
  int visible;
  int zan;

  factory ArticleEntity.fromJson(Map<String, dynamic> json) =>
      ArticleEntity(
        apkLink: json['apkLink'],
        audit: json['audit'],
        author: json['author'],
        canEdit: json['canEdit'],
        chapterId: json['chapterId'],
        chapterName: json['chapterName'],
        collect: json['collect'],
        courseId: json['courseId'],
        desc: json['desc'],
        descMd: json['descMd'],
        envelopePic: json['envelopePic'],
        fresh: json['fresh'],
        host: json['host'],
        id: json['id'],
        link: json['link'],
        niceDate: json['niceDate'],
        niceShareDate: json['niceShareDate'],
        origin: json['origin'],
        prefix: json['prefix'],
        projectLink: json['projectLink'],
        publishTime: json['publishTime'],
        realSuperChapterId: json['realSuperChapterId'],
        selfVisible: json['selfVisible'],
        shareDate: json['shareDate'] ?? 0,
        shareUser: json['shareUser'],
        superChapterId: json['superChapterId'],
        superChapterName: json['superChapterName'],
        tags: List<Tag>.from(json['tags'].map((x) => Tag.fromJson(x))),
        title: json['title'].toString().replaceAll('Android', '安|卓'),
        type: json['type'],
        userId: json['userId'],
        visible: json['visible'],
        zan: json['zan'],
      );

  Map<String, dynamic> toJson() => {
        'apkLink': apkLink,
        'audit': audit,
        'author': author,
        'canEdit': canEdit,
        'chapterId': chapterId,
        'chapterName': chapterName,
        'collect': collect,
        'courseId': courseId,
        'desc': desc,
        'descMd': descMd,
        'envelopePic': envelopePic,
        'fresh': fresh,
        'host': host,
        'id': id,
        'link': link,
        'niceDate': niceDate,
        'niceShareDate': niceShareDate,
        'origin': origin,
        'prefix': prefix,
        'projectLink': projectLink,
        'publishTime': publishTime,
        'realSuperChapterId': realSuperChapterId,
        'selfVisible': selfVisible,
        'shareDate': shareDate,
        'shareUser': shareUser,
        'superChapterId': superChapterId,
        'superChapterName': superChapterName,
        'tags': List<dynamic>.from(tags.map((x) => x.toJson())),
        'title': title,
        'type': type,
        'userId': userId,
        'visible': visible,
        'zan': zan,
      };
}

class Tag {
  Tag({
    this.name = '',
    this.url = '',
  });

  String name;
  String url;

  factory Tag.fromJson(Map<String, dynamic> json) => Tag(
        name: json['name'],
        url: json['url'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'url': url,
      };
}

// enum SuperChapterName {
//   public,
//   technology,
//   squareTab,
//   openSourceTab,
//   original,
//   course,
//   develop,
//   jetpack,
//   project,
//   framework,
//   interaction,
// }

// extension SuperChapterNameExtension on SuperChapterName {
//   String get value => nameValues.reverse[this]!;
// }

// final nameValues = EnumValues({
//   '公众号': SuperChapterName.public,
//   '技术周报': SuperChapterName.squareTab,
//   '广场Tab': SuperChapterName.technology,
//   '开源项目主Tab': SuperChapterName.openSourceTab,
//   '原创文章': SuperChapterName.original,
//   '教程': SuperChapterName.course,
//   '开发环境': SuperChapterName.develop,
//   'Jetpack': SuperChapterName.jetpack,
//   '项目必备': SuperChapterName.project,
//   'framework': SuperChapterName.framework,
//   '用户交互': SuperChapterName.interaction,
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     return reverseMap ?? map.map((k, v) => MapEntry(v, k));
//   }
// }
