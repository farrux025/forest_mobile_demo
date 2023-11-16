import 'package:hive/hive.dart';

part 'RegionChildren.g.dart';

@HiveType(typeId: 41)
class RegionChildren {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? name;

  RegionChildren({
    this.id,
    this.name,
  });

  RegionChildren.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  RegionChildren copyWith({
    int? id,
    String? name,
  }) =>
      RegionChildren(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }
}
