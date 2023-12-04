import 'package:hive/hive.dart';

part 'Nutrient.g.dart';

@HiveType(typeId: 4)
class Nutrient {
  @HiveField(0)
  int calories;

  @HiveField(1)
  int carbo;

  @HiveField(2)
  int protein;

  @HiveField(3)
  int fat;

  @HiveField(4)
  int fitnessTime;

  Nutrient({
    required this.calories,
    required this.carbo,
    required this.protein,
    required this.fat,
    required this.fitnessTime,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      calories: json['calories'] as int,
      carbo: json['carbo'] as int,
      protein: json['protein'] as int,
      fat: json['fat'] as int,
      fitnessTime: json['fitnessTime'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'calories': calories,
      'carbo': carbo,
      'protein': protein,
      'fat': fat,
      'fitnessTime': fitnessTime,
    };
  }

  @override
  String toString() {
    return 'Nutrient { calories: $calories, carbo: $carbo, protein: $protein, fat: $fat, fitnessTime: $fitnessTime }';
  }
}
