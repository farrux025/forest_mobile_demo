import 'package:forest_mobile/models/region/RegionChildren.dart';
import 'package:forest_mobile/service/hive/hive_store.dart';
import 'package:hive/hive.dart';

part 'RegionResponse.g.dart';

@HiveType(typeId: MyHiveTypeId.regionListBoxID)
class RegionResponse {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;
  @HiveField(2)
  List<RegionChildren>? children;

  RegionResponse({
    this.id,
    this.name,
    this.children,
  });

  RegionResponse.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    if (json['children'] != null) {
      children = [];
      json['children'].forEach((v) {
        children?.add(RegionChildren.fromJson(v));
      });
    }
  }

  RegionResponse copyWith({
    int? id,
    String? name,
    List<RegionChildren>? children,
  }) =>
      RegionResponse(
        id: id ?? this.id,
        name: name ?? this.name,
        children: children ?? this.children,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    if (children != null) {
      map['children'] = children?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
