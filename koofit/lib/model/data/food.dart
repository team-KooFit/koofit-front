import 'package:hive/hive.dart';

part 'food.g.dart';

@HiveType(typeId: 0)
class Food {
  @HiveField(0)
  String foodName;

  @HiveField(1)
  String manufacturer;

  @HiveField(2)
  String foodCode;

  @HiveField(3)
  String? foodWeight;

  @HiveField(4)
  double? carbo;

  @HiveField(5)
  double? protein;

  @HiveField(6)
  double? fat;

  @HiveField(7)
  double? sugar;

  @HiveField(8)
  double? calories;

  Food({
    required this.foodCode,
    required this.foodName,
    required this.manufacturer,
    required this.foodWeight,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbo,
    required this.sugar,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      foodName: json['foodName'],
      manufacturer: json['manufacturer'],
      foodCode: json['foodCode'],
      foodWeight: json['foodWeight'],
      carbo: json['carbo'],
      protein: json['protein'],
      fat: json['fat'],
      sugar: json['sugar'],
      calories: json['calories'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'foodName': foodName,
      'manufacturer': manufacturer,
      'foodCode': foodCode,
      'foodWeight': foodWeight,
      'carbo': carbo,
      'protein': protein,
      'fat': fat,
      'sugar': sugar,
      'calories': calories,
    };
  }

  @override
  String toString() {
    return 'Food{foodName: $foodName, manufacturer: $manufacturer, '
        'foodCode: $foodCode, foodWeight: $foodWeight, carbo: $carbo, '
        'protein: $protein, fat: $fat, sugar: $sugar, calories: $calories}';
  }
}
