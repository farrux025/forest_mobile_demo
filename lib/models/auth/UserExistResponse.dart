/// success : true
/// code : 0
/// msg : "OK"

class UserExistResponse {
  bool? success;
  num? code;
  String? msg;

  UserExistResponse({
    this.success,
    this.code,
    this.msg,
  });

  UserExistResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    msg = json['msg'];
  }

  UserExistResponse copyWith({
    bool? success,
    num? code,
    String? msg,
  }) =>
      UserExistResponse(
        success: success ?? this.success,
        code: code ?? this.code,
        msg: msg ?? this.msg,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['code'] = code;
    map['msg'] = msg;
    return map;
  }
}
