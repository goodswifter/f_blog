///
/// Author       : zhongaidong
/// Date         : 2022-05-01 20:30:41
/// Description  : 设置语言页面
///
import 'package:blog/core/resource/divider_handler.dart';
import 'package:blog/entity/language_entity.dart';
import 'package:blog/generated/l10n.dart';
import 'package:blog/utils/sp_util/sp_util.dart';
import 'package:blog/widgets/custom_app_bar.dart';
import 'package:blog/widgets/over_scroll_behavior.dart';
import 'package:flutter/material.dart';

import 'setting_language_item.dart';

class SettingLanguagePage extends StatefulWidget {
  const SettingLanguagePage({Key? key}) : super(key: key);

  @override
  State<SettingLanguagePage> createState() => _SettingLanguagePageState();
}

class _SettingLanguagePageState extends State<SettingLanguagePage> {
  /// 应用支持的语言
  late List<LanguageEntity> languages = languageList;

  @override
  void initState() {
    super.initState();

    /// 读取语言存储
    var languageModel = SpUtil.getLanguage();
    if (languageModel == null) {
      languages[0].isSelect = true;
    } else {
      /// 找到当前选中的语言
      for (var item in languages) {
        if (item.name == languageModel.name) {
          item.isSelect = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppBar(title: S.of(context).settingLanguage),
          DividerHandler.divider1Half,
          ScrollConfiguration(
              behavior: OverScrollBehavior(),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                itemCount: languages.length,
                itemBuilder: (_, int index) => SettingLanguageItem(
                  languages: languages,
                  index: index,
                ),
              ))
        ],
      ),
    );
  }
}
