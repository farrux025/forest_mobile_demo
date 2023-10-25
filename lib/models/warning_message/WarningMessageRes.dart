/// id : 2
/// created : "2023-10-05T12:54:00.175923Z"
/// updated : "2023-10-05T12:54:00.175953Z"
/// title : "Test"
/// description : "test"
/// status : "NEW"
/// type : 1
/// creator : 1
/// inspector : 1

class WarningMessageRes {
  WarningMessageRes({
      this.id, 
      this.created, 
      this.updated, 
      this.title, 
      this.description, 
      this.status, 
      this.type, 
      this.creator, 
      this.inspector,});

  WarningMessageRes.fromJson(dynamic json) {
    id = json['id'];
    created = json['created'];
    updated = json['updated'];
    title = json['title'];
    description = json['description'];
    status = json['status'];
    type = json['type'];
    creator = json['creator'];
    inspector = json['inspector'];
  }
  num? id;
  String? created;
  String? updated;
  String? title;
  String? description;
  String? status;
  num? type;
  num? creator;
  num? inspector;
WarningMessageRes copyWith({  num? id,
  String? created,
  String? updated,
  String? title,
  String? description,
  String? status,
  num? type,
  num? creator,
  num? inspector,
}) => WarningMessageRes(  id: id ?? this.id,
  created: created ?? this.created,
  updated: updated ?? this.updated,
  title: title ?? this.title,
  description: description ?? this.description,
  status: status ?? this.status,
  type: type ?? this.type,
  creator: creator ?? this.creator,
  inspector: inspector ?? this.inspector,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['created'] = created;
    map['updated'] = updated;
    map['title'] = title;
    map['description'] = description;
    map['status'] = status;
    map['type'] = type;
    map['creator'] = creator;
    map['inspector'] = inspector;
    return map;
  }

}