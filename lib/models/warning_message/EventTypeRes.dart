import 'package:forest_mobile/service/hive/hive_store.dart';
import 'package:hive/hive.dart';

/// id : 3
/// name : "TARNADO"
/// ord : 1
/// status : "NEW"

part 'EventTypeRes.g.dart';

@HiveType(typeId: MyHiveTypeId.eventTypeResID)
class EventTypeRes {
  @HiveField(0)
  num? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  num? ord;
  @HiveField(3)
  String? status;

  EventTypeRes({
    this.id,
    this.name,
    this.ord,
    this.status,
  });

  EventTypeRes.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    ord = json['ord'];
    status = json['status'];
  }

  EventTypeRes copyWith({
    num? id,
    String? name,
    num? ord,
    String? status,
  }) =>
      EventTypeRes(
        id: id ?? this.id,
        name: name ?? this.name,
        ord: ord ?? this.ord,
        status: status ?? this.status,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['ord'] = ord;
    map['status'] = status;
    return map;
  }
}
