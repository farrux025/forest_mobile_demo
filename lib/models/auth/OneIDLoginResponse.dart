/// data : {"id":325,"first_name":"FARRUXJON","sur_name":"NE’MATILLAYEV","phone":"+998941706111","auth_type":"OneID"}
/// access_token : "f88fa688e9780beef390e6588077911f9246a6c64019b988034cea22de99699e5d48085e132bd11b"

class OneIdLoginResponse {
  OneIdLoginResponse({
    this.data,
    this.accessToken,
  });

  OneIdLoginResponse.fromJson(dynamic json) {
    data = json['data'] != null ? OneIDResponseData.fromJson(json['data']) : null;
    accessToken = json['access_token'];
  }

  OneIDResponseData? data;
  String? accessToken;

  OneIdLoginResponse copyWith({
    OneIDResponseData? data,
    String? accessToken,
  }) =>
      OneIdLoginResponse(
        data: data ?? this.data,
        accessToken: accessToken ?? this.accessToken,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['access_token'] = accessToken;
    return map;
  }
}

/// id : 325
/// first_name : "FARRUXJON"
/// sur_name : "NE’MATILLAYEV"
/// phone : "+998941706111"
/// auth_type : "OneID"

class OneIDResponseData {
  OneIDResponseData({
    this.id,
    this.firstName,
    this.surName,
    this.phone,
    this.authType,
  });

  OneIDResponseData.fromJson(dynamic json) {
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

  OneIDResponseData copyWith({
    num? id,
    String? firstName,
    String? surName,
    String? phone,
    String? authType,
  }) =>
      OneIDResponseData(
        id: id ?? this.id,
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
