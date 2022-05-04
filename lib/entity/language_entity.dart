///
/// Author       : zhongaidong
/// Date         : 2022-05-01 20:35:43
/// Description  : 语言实体类
///

class LanguageEntity {
  LanguageEntity({
    this.name = '',
    this.language = '',
    this.country = '',
    this.isSelect = false,
  });

  String name;
  String language;
  String country;
  bool isSelect = false;

  LanguageEntity.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        language = json['language'],
        country = json['country'],
        isSelect = json['isSelect'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'language': language,
        'country': country,
        'isSelect': isSelect,
      };
}

/// 新增语言要在此处手动增加
final languageList = [
  LanguageEntity(),
  LanguageEntity(name: '简体中文', language: 'zh', country: 'CN'),
  LanguageEntity(name: '繁體中文(香港)', language: 'zh', country: 'HK'),
  LanguageEntity(name: '繁體中文(台灣)', language: 'zh', country: 'TW'),
  LanguageEntity(name: 'English', language: 'en', country: 'US'),
];
