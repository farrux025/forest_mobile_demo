import 'package:forest_mobile/models/auth/OneIdResData.dart';
import 'package:forest_mobile/service/hive/hive_store.dart';
import 'package:hive/hive.dart';

part 'OneIDLoginResponse.g.dart';

@HiveType(typeId: MyHiveTypeId.oneIDResBoxID)
class OneIDLoginResponse {
  @HiveField(0)
  OneIdResData? data;
  @HiveField(1)
  String? accessToken;

  OneIDLoginResponse({
    this.data,
    this.accessToken,
  });

  OneIDLoginResponse.fromJson(dynamic json) {
    data = json['data'] != null ? OneIdResData.fromJson(json['data']) : null;
    accessToken = json['access_token'];
  }

  OneIDLoginResponse copyWith({
    OneIdResData? data,
    String? accessToken,
  }) =>
      OneIDLoginResponse(
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
