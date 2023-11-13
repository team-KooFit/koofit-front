import 'package:hive/hive.dart';

part 'diet.g.dart';

@HiveType(typeId: 2)
class Diet{

  @HiveField(0)
  String uid;

  @HiveField(1)
  String stuNumber;

  @HiveField(2)
  String date; //등록한 날짜

  @HiveField(3)
  String keyTime; //등록한 시간대 (아침/점심/저녁/간식)

  @HiveField(4)
  String foodCode;

  @HiveField(5)
  Map<String, dynamic> nutrient; //영양성분 :[{'포카칩' : {'탄수화물' : 24, '단백질' : 10, '지방':2, '칼로리' : 250}, {'주스' : {...} } ] 아니면 { 이름 : '포카칩', 식품코드: '100000' }



  Diet({
    required this.uid,
    required this.stuNumber,
    required this.date,
    required this.keyTime,
    required this.foodCode,
    required this.nutrient
  });

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      uid: json['uid'],
      stuNumber: json['stu_number'],
      date: json['date'],
      keyTime: json['keyTime'],
      foodCode: json['foodCode'],
      nutrient: Map<String, dynamic> .from(json['goalNutrient']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'stuNumber': stuNumber,
      'date': date,
      'keyTime' : keyTime,
      'foodCode': foodCode,
      'nutrient' : nutrient
    };
  }

}