// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'OneIdResData.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OneIdResDataAdapter extends TypeAdapter<OneIdResData> {
  @override
  final int typeId = 21;

  @override
  OneIdResData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OneIdResData(
      id: fields[0] as int?,
      username: fields[1] as String?,
      pin: fields[2] as String?,
      email: fields[3] as String?,
      status: fields[4] as int?,
      stir: fields[5] as String?,
      passport: fields[6] as String?,
      firstName: fields[7] as String?,
      surName: fields[8] as String?,
      midName: fields[9] as String?,
      fullName: fields[10] as String?,
      userType: fields[11] as String?,
      phone: fields[12] as String?,
      birthDate: fields[13] as String?,
      gd: fields[14] as String?,
      perAdr: fields[15] as String?,
      birthPlace: fields[16] as String?,
      citizenship: fields[17] as String?,
      nationality: fields[18] as String?,
      pportIssuePlace: fields[19] as String?,
      pportIssueDate: fields[20] as String?,
      pportExprDate: fields[21] as String?,
      legalStir: fields[22] as String?,
      legalName: fields[23] as String?,
      isLegalEntity: fields[24] as bool?,
      authType: fields[25] as String?,
      clientType: fields[26] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, OneIdResData obj) {
    writer
      ..writeByte(27)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.username)
      ..writeByte(2)
      ..write(obj.pin)
      ..writeByte(3)
      ..write(obj.email)
      ..writeByte(4)
      ..write(obj.status)
      ..writeByte(5)
      ..write(obj.stir)
      ..writeByte(6)
      ..write(obj.passport)
      ..writeByte(7)
      ..write(obj.firstName)
      ..writeByte(8)
      ..write(obj.surName)
      ..writeByte(9)
      ..write(obj.midName)
      ..writeByte(10)
      ..write(obj.fullName)
      ..writeByte(11)
      ..write(obj.userType)
      ..writeByte(12)
      ..write(obj.phone)
      ..writeByte(13)
      ..write(obj.birthDate)
      ..writeByte(14)
      ..write(obj.gd)
      ..writeByte(15)
      ..write(obj.perAdr)
      ..writeByte(16)
      ..write(obj.birthPlace)
      ..writeByte(17)
      ..write(obj.citizenship)
      ..writeByte(18)
      ..write(obj.nationality)
      ..writeByte(19)
      ..write(obj.pportIssuePlace)
      ..writeByte(20)
      ..write(obj.pportIssueDate)
      ..writeByte(21)
      ..write(obj.pportExprDate)
      ..writeByte(22)
      ..write(obj.legalStir)
      ..writeByte(23)
      ..write(obj.legalName)
      ..writeByte(24)
      ..write(obj.isLegalEntity)
      ..writeByte(25)
      ..write(obj.authType)
      ..writeByte(26)
      ..write(obj.clientType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OneIdResDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
