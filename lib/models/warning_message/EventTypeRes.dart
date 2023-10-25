/// id : 3
/// name : "TARNADO"
/// ord : 1
/// status : "NEW"

class EventTypeRes {
  num? id;
  String? name;
  num? ord;
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
