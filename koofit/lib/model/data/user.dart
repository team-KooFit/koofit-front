
class User {
  String uid;
  String name;
  int gender; // 0:남자 1:여자
  String stuNumber;
  String number;
  String age; //int
  String birthday;
  int curWeight;
  int goalWeight;
  List<Map<String, dynamic>> todayNutrientList;
  Map<String, dynamic> goalNutrient;
  List<Map<String, dynamic>> fitnessList;
  List<Map<String, dynamic>> dietList;
  bool serviceNeedsAgreement;
  bool privacyNeedsAgreement;

  User({
    required this.uid,
    required this.name,
    required this.gender,
    required this.stuNumber,
    required this.number,
    required this.age,
    required this.birthday,
    required this.curWeight,
    required this.goalWeight,
    required this.todayNutrientList,
    required this.goalNutrient,
    required this.dietList,
    required this.fitnessList,
    required this.serviceNeedsAgreement,
    required this.privacyNeedsAgreement,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        uid: json['uid'],
        name: json['name'],
        gender: json['gender'],
        stuNumber: json['stu_number'],
        number: json['number'],
        age: json['age'],
        birthday: json['birthday'],
        curWeight: json['cur_weight'],
        goalWeight: json['goal_weight'],
        todayNutrientList: List<Map<String, dynamic>>.from(json['todayNutrient']),
        goalNutrient: Map<String, dynamic> .from(json['goalNutrient']),
        dietList: List<Map<String, dynamic>> .from(json['dietList']),
        fitnessList: List<Map<String, dynamic>> .from(json['fitnessList']),
        serviceNeedsAgreement: json['serviceNeedsAgreement'],
        privacyNeedsAgreement: json['privacyNeedsAgreement']);
  }

  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'name': name,
      'gender': gender,
      'number': number,
      'stuNumber' : stuNumber,
      'age': age,
      'birthday': birthday,
      'curWeight' : curWeight,
      'goalWeight' : goalWeight,
      'todayNutrientList' : todayNutrientList,
      'goalNutrient' : goalNutrient,
      'dietList' : dietList,
      'fitnessList' : fitnessList,
      'serviceNeedsAgreement': serviceNeedsAgreement,
      'privacyNeedsAgreement': privacyNeedsAgreement,
    };
  }

  void updateUserDietList(List<Map<String, dynamic>>  dietList) {
    this.dietList = dietList;
  }

  void updateUserFitnessList(List<Map<String, dynamic>>  fitnessList) {
    this.fitnessList = fitnessList;
  }

  void updateTodayNutrientList(List<Map<String, dynamic>>  todayNutrientList) {
    this.todayNutrientList = todayNutrientList;
  }
  void updateCurWeight(int curWeight) {
    this.curWeight = curWeight;
  }
