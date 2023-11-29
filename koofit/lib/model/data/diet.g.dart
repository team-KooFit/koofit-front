// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietAdapter extends TypeAdapter<Diet> {
  @override
  final int typeId = 3;

  @override
  Diet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Diet(
      stuNumber: fields[0] as String,
      date: fields[1] as String,
      keyTime: fields[2] as String,
      foodName: fields[3] as String,
      nutrient: fields[4] as Food,
    );
  }

  @override
  void write(BinaryWriter writer, Diet obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.stuNumber)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.keyTime)
      ..writeByte(3)
      ..write(obj.foodName)
      ..writeByte(4)
      ..write(obj.nutrient);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
