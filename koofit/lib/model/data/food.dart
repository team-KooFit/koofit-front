class Food {
  String foodName;
  String manufacturer;
  String foodCode;
  String? foodWeight;
  double? carbo;
  double? protein;
  double? fat;
  double? sugar;
  double? calories;

  // 생성자
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

  // fromJson factory method
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

  // toJson method
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

  // toString method
  @override
  String toString() {
    return 'Food{foodName: $foodName, manufacturer: $manufacturer, foodCode: $foodCode, '
        'foodWeight: $foodWeight, carbo: $carbo, protein: $protein, fat: $fat, sugar: $sugar, calories: $calories}';
  }
}
