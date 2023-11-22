import 'package:flutter/material.dart';
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

  Future readUser() async {
    return userBox!.values;
  }

  Future updateUser(int index, User updatedUser) async {
    userBox!.putAt(index, updatedUser);
  }

  Future deleteUser(int index) async {
    userBox!.deleteAt(index);
  }
}
