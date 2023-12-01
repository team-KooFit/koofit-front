import 'package:flutter/material.dart';
import 'package:koofit/model/data/user.dart';
import 'data/food.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';
import 'package:koofit/model/data/fitness.dart';
const String FITNESS_BOX = "FITNESS_BOX";

class HiveFitnessHelper {
  static final HiveFitnessHelper _singleton = HiveFitnessHelper._internal();

  factory HiveFitnessHelper() {
    return _singleton;
  }

  HiveFitnessHelper._internal();

  Box<Fitness>? fitnessBox;

  Future openFitnessBox() async {
    fitnessBox = await Hive.openBox(FITNESS_BOX);
  }

  Future createFitness(Fitness newFitness) async {
    return fitnessBox!.add(newFitness);
  }

  Future readFitness() async {
    print(fitnessBox!.values);
    return fitnessBox!.values;
  }

  Future updateFitness(int index, Fitness updatedFitness) async {
    fitnessBox!.putAt(index, updatedFitness);
  }

  Future deleteFitness(int index) async {
    fitnessBox!.deleteAt(index);
  }

  Future<List<Fitness>> searchFitness(String date) async {

    // Query the box to get all Diet objects with today's date
    final List<Fitness> diets =
    fitnessBox!.values.where((diet) => diet.date == date).toList();

    return diets;
  }

}
