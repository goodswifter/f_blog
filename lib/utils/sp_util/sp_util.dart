///
/// Author       : zhongaidong
/// Date         : 2022-04-22 12:42:05
/// Description  : 键值存储工具
///
import 'dart:convert';

import 'package:blog/entity/article_entity.dart';
import 'package:blog/entity/language_entity.dart';
import 'package:blog/entity/userinfo_entity.dart';
import 'package:blog/pages/mine_module/mine_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'sp_key.dart';

class SpUtil {
  
  /// 获取存储对象
  static final SharedPreferences sp = Get.find<SharedPreferences>();

  /// 我的模块控制器
  static var mineController = Get.find<MineController>();

  /// 更新[userinfo]用户信息
  static updateUserinfo(UserinfoEntity userinfo) {
    var oldInfo = getUserinfo();
    if (oldInfo != null) {
      userinfo.password = oldInfo.password;
    }
    SpUtil.deleteUserinfo();
    SpUtil.saveUserinfo(userinfo);
  }

  /// 删除存储用户信息
  static deleteUserinfo() {
    sp.remove(SpKey.kUserinfo);
  }

  /// 存储[userinfo]用户信息
  static saveUserinfo(UserinfoEntity userinfo) {
    sp.setString(SpKey.kUserinfo, jsonEncode(userinfo.toJson()));
  }

  /// 获取用户信息
  static UserinfoEntity? getUserinfo() {
    try {
      var json = sp.getString(SpKey.kUserinfo);
      if (json == null) return null;
      return UserinfoEntity.fromJson(jsonDecode(json));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  /// 浏览历史记录
  /// [detail] 浏览记录
  static saveBrowseHistory(ArticleEntity detail) {
    var history = getBrowseHistory();
    for (var element in history) {
      Map<String, dynamic> map = jsonDecode(element);
      var convert = ArticleEntity.fromJson(map);
      if (convert.id == detail.id) return;
    }
    var toJson = jsonEncode(detail.toJson());
    history.insert(0, toJson);
    sp.setStringList(SpKey.browseHistory, history);

    // 更新历史记录个数
    mineController.updateBrowseHistory();
  }

  /// 浏览记录JSON转换为Model之后的数据
  static List<ArticleEntity> getBrowseHistoryModel() {
    var data = <ArticleEntity>[];
    var history = getBrowseHistory();
    for (var element in history) {
      var map = jsonDecode(element);
      var convert = ArticleEntity.fromJson(map);
      data.add(convert);
    }
    return data;
  }

  /// 浏览记录长度
  static int getBrowseHistoryLength() {
    return getBrowseHistory().length;
  }

  /// 获取浏览历史记录
  static List<String> getBrowseHistory() {
    try {
      var json = sp.getStringList(SpKey.browseHistory);
      return json ?? [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  /// 获取搜索历史记录
  static List<String> getSearchHistory() {
    try {
      var json = sp.getStringList(SpKey.searchHistory);
      return json ?? [];
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  /// 保存搜索历史记录
  static saveSearchHistory(String word) {
    var history = getSearchHistory();
    if (history.contains(word)) return;

    history.insert(0, word);
    sp.setStringList(SpKey.searchHistory, history);
  }

  /// 清空搜索历史
  static void deleteSearchHistory() => sp.remove(SpKey.searchHistory);

  /// 更新语言
  static updateLanguage(LanguageEntity language) {
    sp.remove(SpKey.language);
    sp.setString(SpKey.language, jsonEncode(language.toJson()));
  }

  /// 获取语言
  static LanguageEntity? getLanguage() {
    try {
      var json = sp.getString(SpKey.language);
      if (json == null) return null;

      return LanguageEntity.fromJson(jsonDecode(json));
    } catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
