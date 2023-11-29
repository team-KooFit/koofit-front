// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodAdapter extends TypeAdapter<Food> {
  @override
  final int typeId = 0;

  @override
  Food read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Food(
      foodCode: fields[2] as String,
      foodName: fields[0] as String,
      manufacturer: fields[1] as String,
      foodWeight: fields[3] as String?,
      calories: fields[8] as double?,
      protein: fields[5] as double?,
      fat: fields[6] as double?,
      carbo: fields[4] as double?,
      sugar: fields[7] as double?,
    );
  }

  @override
  void write(BinaryWriter writer, Food obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.foodName)
      ..writeByte(1)
      ..write(obj.manufacturer)
      ..writeByte(2)
      ..write(obj.foodCode)
      ..writeByte(3)
      ..write(obj.foodWeight)
      ..writeByte(4)
      ..write(obj.carbo)
      ..writeByte(5)
      ..write(obj.protein)
      ..writeByte(6)
      ..write(obj.fat)
      ..writeByte(7)
      ..write(obj.sugar)
      ..writeByte(8)
      ..write(obj.calories);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FoodAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
