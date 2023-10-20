/// id : 10
/// file : "http://127.0.0.1:5000/media/message_images/makro.png"

class UploadImageResponse {
  UploadImageResponse({
    this.id,
    this.file,});

  UploadImageResponse.fromJson(dynamic json) {
    id = json['id'];
    file = json['file'];
  }

  num? id;
  String? file;

  UploadImageResponse copyWith({ num? id,
    String? file,
  }) =>
      UploadImageResponse(id: id ?? this.id,
        file: file ?? this.file,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['file'] = file;
    return map;
  }

}