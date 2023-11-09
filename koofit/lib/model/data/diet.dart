
class Diet{
  String uid;
  String stuNumber;
  String date; //등록한 날짜
  String keyTime; //등록한 시간대 (아침/점심/저녁/간식)
  String foodName;
  int foodCaolory;
  Map<String, dynamic> nutrient; //영양성분 :{'탄수화물' : 24, '단백질' : 10, '지방':2}



  Diet({
    required this.uid,
    required this.stuNumber,
    required this.date,
    required this.keyTime,
    required this.foodName,
    required this.foodCaolory,
    required this.nutrient

  });

  factory Diet.fromJson(Map<String, dynamic> json) {
    return Diet(
      uid: json['uid'],
      stuNumber: json['stu_number'],
      date: json['date'],
      keyTime: json['keyTime'],
      foodName: json['foodName'],
      foodCaolory: json['foodCaolory'],
      nutrient: Map<String, dynamic> .from(json['goalNutrient']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'stuNumber': stuNumber,
      'date': date,
      'keyTime' : keyTime,
      'foodName': foodName,
      'foodCaolory': foodCaolory,
      'nutrient' : nutrient
    };
  }

}