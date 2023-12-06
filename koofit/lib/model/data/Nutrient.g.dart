// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Nutrient.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NutrientAdapter extends TypeAdapter<Nutrient> {
  @override
  final int typeId = 4;

  @override
  Nutrient read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Nutrient(
      calories: fields[0] as int,
      carbo: fields[1] as int,
      protein: fields[2] as int,
      fat: fields[3] as int,
      fitnessTime: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Nutrient obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.calories)
      ..writeByte(1)
      ..write(obj.carbo)
      ..writeByte(2)
      ..write(obj.protein)
      ..writeByte(3)
      ..write(obj.fat)
      ..writeByte(4)
      ..write(obj.fitnessTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NutrientAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
