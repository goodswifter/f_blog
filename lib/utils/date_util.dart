///
/// Author       : zhongaidong
/// Date         : 2022-05-02 20:05:42
/// Description  : 日期工具类
///

class DateUtil {
  static String milliseconds2Date(int timestamp) {
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    return date.toLocal().toString().substring(0, 16);
  }
}
