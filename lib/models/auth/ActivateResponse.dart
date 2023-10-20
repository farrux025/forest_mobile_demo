/// success : true
/// code : 0
/// msg : "OK"
/// data : {"id":321,"first_name":"Akmal","sur_name":"Hakimov","phone":"+998995153002","auth_type":"Phone"}
/// access_token : "26fd5c84fb2c5e64297631fa33730c5ea15747acb50e02665a69df022207db71a0402d9edf78504f"

class ActivateResponse {
  ActivateResponse({
      this.success, 
      this.code, 
      this.msg, 
      this.data, 
      this.accessToken,});

  ActivateResponse.fromJson(dynamic json) {
    success = json['success'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    accessToken = json['access_token'];
  }
  bool? success;
  num? code;
  String? msg;
  Data? data;
  String? accessToken;
ActivateResponse copyWith({  bool? success,
  num? code,
  String? msg,
  Data? data,
  String? accessToken,
}) => ActivateResponse(  success: success ?? this.success,
  code: code ?? this.code,
  msg: msg ?? this.msg,
  data: data ?? this.data,
  accessToken: accessToken ?? this.accessToken,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['code'] = code;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['access_token'] = accessToken;
    return map;
  }

}

/// id : 321
/// first_name : "Akmal"
/// sur_name : "Hakimov"
/// phone : "+998995153002"
/// auth_type : "Phone"

class Data {
  Data({
      this.id, 
      this.firstName, 
      this.surName, 
      this.phone, 
      this.authType,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['first_name'];
    surName = json['sur_name'];
    phone = json['phone'];
    authType = json['auth_type'];
  }
  num? id;
  String? firstName;
  String? surName;
  String? phone;
  String? authType;
Data copyWith({  num? id,
  String? firstName,
  String? surName,
  String? phone,
  String? authType,
}) => Data(  id: id ?? this.id,
  firstName: firstName ?? this.firstName,
  surName: surName ?? this.surName,
  phone: phone ?? this.phone,
  authType: authType ?? this.authType,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['first_name'] = firstName;
    map['sur_name'] = surName;
    map['phone'] = phone;
    map['auth_type'] = authType;
    return map;
  }

}