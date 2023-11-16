// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OneIDLoginResponse.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OneIDLoginResponseAdapter extends TypeAdapter<OneIDLoginResponse> {
  @override
  final int typeId = 2;

  @override
  OneIDLoginResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OneIDLoginResponse(
      data: fields[0] as OneIdResData?,
      accessToken: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OneIDLoginResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.accessToken);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OneIDLoginResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
