// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fitness.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FitnessAdapter extends TypeAdapter<Fitness> {
  @override
  final int typeId = 1;

  @override
  Fitness read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Fitness(
      uid: fields[0] as String,
      stuNumber: fields[1] as String,
      date: fields[2] as String,
      burnedCalories: fields[3] as int,
      time: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Fitness obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.stuNumber)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.burnedCalories)
      ..writeByte(4)
      ..write(obj.time);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FitnessAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
