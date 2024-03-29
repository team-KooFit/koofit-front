import 'package:hive/hive.dart';
import 'Nutrient.dart';
import 'food.dart';
part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  String uid;

  @HiveField(1)
  String name;

  @HiveField(2)
  String gender; // 0:남자 1:여자

  @HiveField(3)
  String stuNumber; //학번

  @HiveField(4)
  String number; //핸드폰번호

  @HiveField(5)
  String age; //int

  @HiveField(6)
  int? height; //키

  @HiveField(7)
  int? curWeight; //현재 몸무게

  @HiveField(8)
  int? goalWeight; //목표 몸무게

  @HiveField(9)
  Nutrient? goalNutrient; // 일일 권장 영양성분 {'탄수화물' : 22, '단백질' : 45, '지방' : 20, '목표 칼로리' : 2000}

  @HiveField(10)
  List<Map<String, dynamic>>?
      todayNutrientList; //유저별 식단data 리스트 [{'20231109' : {'아침' : dietData, '점심' : dietData, '저녁' : dietData}, {...} ]

  @HiveField(11)
  List<Map<String, dynamic>>?
      fitnessList; //유저 운동 데이터 리스트 [{'날짜' : Fitness.data, {..} ]

  @HiveField(12)
  List<DateTime> recordedDayList;

  @HiveField(13)
  List<Food> favorieFoodList;

  User({
    required this.uid,
    required this.name,
    required this.gender,
    required this.stuNumber,
    required this.number,
    required this.age,
    required this.height,
    required this.curWeight,
    required this.goalWeight,
    required this.todayNutrientList,
    required this.goalNutrient,
    required this.fitnessList,
    required this.recordedDayList,
    required this.favorieFoodList,

  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        uid: json['uid'],
        name: json['name'],
        gender: json['gender'],
        stuNumber: json['stu_number'],
        number: json['number'],
        age: json['age'],
        height: json['height'],
        curWeight: json['cur_weight'],
        goalWeight: json['goal_weight'],
        todayNutrientList:
            List<Map<String, dynamic>>.from(json['todayNutrient']),
        goalNutrient: Nutrient.fromJson(json['goalNutrient']),
        fitnessList: List<Map<String, dynamic>>.from(json['fitnessList']),
        recordedDayList: List<DateTime>.from(json['recordedDayList']),
        favorieFoodList: List<Food>.from(json['favorieFoodList'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'gender': gender,
      'number': number,
      'stuNumber': stuNumber,
      'age': age,
      'height': height,
      'curWeight': curWeight,
      'goalWeight': goalWeight,
      'todayNutrientList': todayNutrientList,
      'goalNutrient': goalNutrient,
      'fitnessList': fitnessList,
      'recordedDayList': recordedDayList,
      'favorieFoodList': favorieFoodList,
    };
  }

  @override
  String toString() {
    return '\nUser{uid: $uid, name: $name, gender: $gender, stuNumber: $stuNumber, number: $number, age: $age, height: $height, curWeight: $curWeight, goalWeight: $goalWeight, todayNutrientList: $todayNutrientList, goalNutrient: $goalNutrient, fitnessList: $fitnessList, recordedDayList: $recordedDayList, favorieFoodList: $favorieFoodList}';
  }

  void updateUserFitnessList(List<Map<String, dynamic>> fitnessList) {
    this.fitnessList = fitnessList;
  }

  void updateTodayNutrientList(List<Map<String, dynamic>> todayNutrientList) {
    this.todayNutrientList = todayNutrientList;
  }

  void updateCurWeight(int curWeight) {
    this.curWeight = curWeight;
  }
}

