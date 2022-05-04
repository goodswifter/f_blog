/// 
/// Author       : zhongaidong
/// Date         : 2022-04-22 21:01:38
/// Description  : 
///     BaseRespR<T> 返回 status code msg data Response.
/// 

class RequestResultEntity<T> {
  int errorCode;
  String errorMsg;
  T data;

  RequestResultEntity(this.errorCode, this.errorMsg, this.data);

  RequestResultEntity.fromJson(Map<String, dynamic> json)
      : errorCode = json['errorCode'],
        errorMsg = json['errorMsg'],
        data = json['data'];

  @override
  String toString() {
    StringBuffer sb = StringBuffer('{');
    sb.write(",\"code\":$errorCode");
    sb.write(",\"msg\":\"$errorMsg\"");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}