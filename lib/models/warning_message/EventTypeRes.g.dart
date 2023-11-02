// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'EventTypeRes.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EventTypeResAdapter extends TypeAdapter<EventTypeRes> {
  @override
  final int typeId = 1;

  @override
  EventTypeRes read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EventTypeRes(
      id: fields[0] as num?,
      name: fields[1] as String?,
      ord: fields[2] as num?,
      status: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, EventTypeRes obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.ord)
      ..writeByte(3)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventTypeResAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
