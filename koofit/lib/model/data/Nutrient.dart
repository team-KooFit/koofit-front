import 'package:hive/hive.dart';

part 'Nutrient.g.dart';

@HiveType(typeId: 4)
class Nutrient {
  @HiveField(0)
  String calories;

  @HiveField(1)
  String carbo;

  @HiveField(2)
  String protein;

  @HiveField(3)
  String fat;

  @HiveField(4)
  String? fitnessTime;

  Nutrient({
    required this.calories,
    required this.carbo,
    required this.protein,
    required this.fat,
    this.fitnessTime,
  });

  factory Nutrient.fromJson(Map<String, dynamic> json) {
    return Nutrient(
      calories: json['calories'] as String,
      carbo: json['carbo'] as String,
      protein: json['protein'] as String,
      fat: json['fat'] as String,
      fitnessTime: json['fitnessTime'] as String?,
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
