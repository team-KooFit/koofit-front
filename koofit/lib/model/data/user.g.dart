// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      uid: fields[0] as String,
      name: fields[1] as String,
      gender: fields[2] as String,
      stuNumber: fields[3] as String,
      number: fields[4] as String,
      age: fields[5] as String,
      height: fields[6] as int?,
      curWeight: fields[7] as int?,
      goalWeight: fields[8] as int?,
      todayNutrientList: (fields[10] as List?)
          ?.map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      goalNutrient: (fields[9] as Map?)?.cast<String, dynamic>(),
      fitnessList: (fields[11] as List?)
          ?.map((dynamic e) => (e as Map).cast<String, dynamic>())
          .toList(),
      serviceNeedsAgreement: fields[12] as bool?,
      privacyNeedsAgreement: fields[13] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.gender)
      ..writeByte(3)
      ..write(obj.stuNumber)
      ..writeByte(4)
      ..write(obj.number)
      ..writeByte(5)
      ..write(obj.age)
      ..writeByte(6)
      ..write(obj.height)
      ..writeByte(7)
      ..write(obj.curWeight)
      ..writeByte(8)
      ..write(obj.goalWeight)
      ..writeByte(9)
      ..write(obj.goalNutrient)
      ..writeByte(10)
      ..write(obj.todayNutrientList)
      ..writeByte(11)
      ..write(obj.fitnessList)
      ..writeByte(12)
      ..write(obj.serviceNeedsAgreement)
      ..writeByte(13)
      ..write(obj.privacyNeedsAgreement);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
