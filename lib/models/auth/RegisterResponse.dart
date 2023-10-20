/// success : true
/// code : 0
/// msg : "OK"

class RegisterResponse {
  bool? success;
  num? code;
  String? msg;

  RegisterResponse({
    this.success,
    this.code,
    this.msg,
  });

  RegisterResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    msg = json['msg'];
  }

  RegisterResponse copyWith({
    bool? success,
    num? code,
    String? msg,
  }) =>
      RegisterResponse(
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
