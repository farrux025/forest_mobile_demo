/// id : 11
/// type : 2
/// title : "KNOWN USER"
/// description : "KNOWN USER KNOWN USER"

class WarningMessageCreateRes {
  WarningMessageCreateRes({
      this.id, 
      this.type, 
      this.title, 
      this.description,});

  WarningMessageCreateRes.fromJson(dynamic json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    description = json['description'];
  }
  num? id;
  num? type;
  String? title;
  String? description;
WarningMessageCreateRes copyWith({  num? id,
  num? type,
  String? title,
  String? description,
}) => WarningMessageCreateRes(  id: id ?? this.id,
  type: type ?? this.type,
  title: title ?? this.title,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['type'] = type;
    map['title'] = title;
    map['description'] = description;
    return map;
  }

}