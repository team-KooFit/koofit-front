import 'package:hive/hive.dart';
import 'food.dart';
part 'diet.g.dart';

@HiveType(typeId: 3)
class Diet {

  @HiveField(0)
  String stuNumber;

  @HiveField(1)
  String date; //등록한 날짜

  @HiveField(2)
  String keyTime; //등록한 시간대 (아침/점심/저녁/간식)

  @HiveField(3)
  String foodName;

  @HiveField(4)
  Food nutrient; //영양성분 :[{'포카칩' : foodData, {'주스' : {...} } ] 아니면 { 이름 : '포카칩', 식품코드: '100000' }

  Diet(
      {
      required this.stuNumber,
      required this.date,
      required this.keyTime,
      required this.foodName,
      required this.nutrient});

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      stuNumber: json['stu_number'],
      date: json['date'],
      keyTime: json['keyTime'],
      foodName: json['foodName'],
      nutrient: Food.fromJson(Map<String, dynamic>.from(json['nutrient'])),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'stuNumber': stuNumber,
      'date': date,
      'keyTime': keyTime,
      'foodCode': foodName,
      'nutrient': nutrient
    };
  }

  @override
  String toString() {
    return '\nDiet{ stuNumber: $stuNumber, date: $date, keyTime: $keyTime, foodName: $foodName, nutrient: $nutrient}';
  }

}
