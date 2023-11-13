
class Fitness {
  String uid;
  String stuNumber;
  String date; //운동한 날짜
  int burnedCalories;
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