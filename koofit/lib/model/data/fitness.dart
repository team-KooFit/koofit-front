import 'package:hive/hive.dart';

part 'fitness.g.dart';

@HiveType(typeId: 1)
class Fitness {

  @HiveField(0)
  String uid;

  @HiveField(1)
  String stuNumber;

  @HiveField(2)
  String date; //운동한 날짜

  @HiveField(3)
  int burnedCalories;

  @HiveField(4)
  int time; //운동 몇 분 했는 지에 대한 시간

  Fitness({
    required this.uid,
    required this.stuNumber,
    required this.date,
    required this.burnedCalories,
    required this.time,

  });

  factory Fitness.fromJson(Map<String, dynamic> json) {
    return Fitness(
      uid: json['uid'],
      stuNumber: json['stu_number'],
      date: json['date'],
      burnedCalories: json['burnedCalories'],
      time: json['time'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'stuNumber': stuNumber,
      'date': date,
      'burnedCalories': burnedCalories,
      'time': time,
    };
  }
}