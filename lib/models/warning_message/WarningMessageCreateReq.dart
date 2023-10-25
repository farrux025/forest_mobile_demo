/// message : {"type":3,"title":"POSTMAN","description":"POSTMAN SCHEMA"}
/// images : [8,9]

class WarningMessageCreateReq {
  WarningMessageCreateReq({
      this.message, 
      this.images,});

  WarningMessageCreateReq.fromJson(dynamic json) {
    message = json['message'] != null ? WarningMessage.fromJson(json['message']) : null;
    images = json['images'] != null ? json['images'].cast<num>() : [];
  }
  WarningMessage? message;
  List<num>? images;
WarningMessageCreateReq copyWith({  WarningMessage? message,
  List<num>? images,
}) => WarningMessageCreateReq(  message: message ?? this.message,
  images: images ?? this.images,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (message != null) {
      map['message'] = message?.toJson();
    }
    map['images'] = images;
    return map;
  }

}

/// type : 3
/// title : "POSTMAN"
/// description : "POSTMAN SCHEMA"

class WarningMessage {
  WarningMessage({
      this.type, 
      this.title, 
      this.description,});

  WarningMessage.fromJson(dynamic json) {
    type = json['type'];
    title = json['title'];
    description = json['description'];
  }
  num? type;
  String? title;
  String? description;
WarningMessage copyWith({  num? type,
  String? title,
  String? description,
}) => WarningMessage(  type: type ?? this.type,
  title: title ?? this.title,
  description: description ?? this.description,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = type;
    map['title'] = title;
    map['description'] = description;
    return map;
  }

}