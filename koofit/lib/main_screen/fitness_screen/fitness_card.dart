import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:koofit/main_screen/fitness_screen/show_fitness_screen.dart';
import 'package:koofit/main_screen/main_diet_screen/show_diet_screen.dart';
import 'package:koofit/main_screen/search_tab_menu/search_diet_screen.dart';
import 'package:koofit/model/HiveFitnessHelper.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:get/get.dart';
import 'package:koofit/model/data/fitness.dart';
import 'package:koofit/model/data/user.dart';
import 'package:koofit/widget/circleText.dart';

class FitnessCard extends StatefulWidget {
  final String selectedDate;
  const FitnessCard({super.key, required this.selectedDate});

  @override
  State<FitnessCard> createState() => _FitnessCardState();
}

class _FitnessCardState extends State<FitnessCard> {

  bool isOuter = true;

  late List<Fitness> todayFitness;
  @override
  void didUpdateWidget(covariant FitnessCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _initializeData(widget.selectedDate);
    }
  }


  Future<void> _initializeData(String date) async {
    HiveFitnessHelper().searchFitness(date).then((value) => todayFitness = value);

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), // 여기서 숫자를 조절하여 둥근 정도를 결정할 수 있습니다.
        ),
        child:
        InkWell(
            onTap: () async {
              await ShowFitness(context, widget.selectedDate);
            },

            child: Card(
              color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                child:
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child:
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text("운동",
                            style: TextStyle(
                              color: Color(0xA5222B45),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),),
                          SizedBox(height: 20,),
                          Text("30분/60분",
                            style: TextStyle(
                              color: Color(0xFF222B45),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            )
                            ,),
                          SizedBox(height: 13,),

                        ]))
            )
        )
    );


  }

}