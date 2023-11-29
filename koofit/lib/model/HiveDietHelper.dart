import 'package:flutter/material.dart';
import 'package:koofit/model/data/user.dart';
import 'data/food.dart';
import 'data/diet.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

const String DIET_BOX = "DIET_BOX";

class HiveDietHelper {
  static final HiveDietHelper _singleton = HiveDietHelper._internal();

  factory HiveDietHelper() {
    return _singleton;
  }

  HiveDietHelper._internal();

  Box<Diet>? dietBox;

  Future openDietBox() async {
    dietBox = await Hive.openBox(DIET_BOX);
  }

  Future createDiet(Diet newDiet) async {
    return dietBox!.add(newDiet);
  }

  Future readDiet() async {
    print(dietBox!.values);
    return dietBox!.values;
  }

  Future updateDiet(int index, Diet updatedDiet) async {
    dietBox!.putAt(index, updatedDiet);
  }

  Future deleteDiet(int index) async {
    dietBox!.deleteAt(index);
  }

  Future<List<Diet>> searchDiet(String date) async{
    // Get today's date in the 'yyyy-MM-dd' format

    // Query the box to get all Diet objects with today's date
    final List<Diet> diets = dietBox!.values
        .where((diet) => diet.date == date)
        .toList();
print("ddddddd${dietBox!.values}");
print("dddddkdkdjahldfk ${date}");
    return diets;

  }
}
