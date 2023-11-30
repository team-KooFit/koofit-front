import 'package:flutter/material.dart';
import 'package:koofit/model/data/Nutrient.dart';
import 'package:koofit/model/data/user.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

const String USER_BOX = "USER_BOX";

class HiveUserHelper {
  static final HiveUserHelper _singleton = HiveUserHelper._internal();

  factory HiveUserHelper() {
    return _singleton;
  }

  HiveUserHelper._internal();

  Box<User>? userBox;

  Future openUserBox() async {
    userBox = await Hive.openBox(USER_BOX);
  }

  Future createUser(User newUser) async {
    return userBox!.add(newUser);
  }

  Future<User> readUser() async {
    final users = userBox!.values.cast<User>(); // Assuming User is the model class
    if (users.isNotEmpty) {
      return users.first; // Returning the first user (you might need to define a logic to select the correct user)
    } else {
      return User(uid: "", name: "name", gender: "gender", stuNumber: "stuNumber", number: "number", age: "age", height: 0, curWeight: 0, goalWeight: 0, todayNutrientList: [],
          goalNutrient: Nutrient(calories: "", carbo: "", protein: "", fat: "") , fitnessList: [], serviceNeedsAgreement: false, privacyNeedsAgreement: false);
    }
  }

  Future updateUser(int index, User updatedUser) async {
    userBox!.putAt(index, updatedUser);
  }

  Future deleteUser(int index) async {
    userBox!.deleteAt(index);
  }
}
