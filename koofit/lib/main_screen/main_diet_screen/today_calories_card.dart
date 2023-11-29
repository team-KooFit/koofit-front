import 'package:flutter/material.dart';
import 'package:koofit/main_screen/main_diet_screen/today_show.dart';
import 'package:koofit/main_screen/search_tab_menu/search_diet_screen.dart';
import 'package:koofit/model/HiveDietHelper.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:get/get.dart';
import 'package:koofit/model/data/diet.dart';
import 'package:koofit/widget/circleText.dart';
import 'package:koofit/widget/loading_view.dart';

class TodayCalorieCard extends StatefulWidget {
  @override
  State<TodayCalorieCard> createState() => _TodayCalorieCardState();
}

class _TodayCalorieCardState extends State<TodayCalorieCard> {
  bool isOuter = true;
  bool isSuccess = false;
  late String todayDate;
  late List<Diet> dietList;

  double totalCalories = 0.0;
  Map<String, dynamic> todayDietMap = {
    "totalCalo": "",
    "carboRate": "",
    "proteinRate": "",
    "fatRate": ""
  };


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    todayDate = DateTime.now().toLocal().toString().split(' ')[0];
print(todayDate);
    HiveDietHelper().readDiet();

    HiveDietHelper().searchDiet(todayDate).then((value) {
      dietList = value;
    print(dietList);
     totalCalories  = (dietList.fold<double>(0.0, (sum, diet) => sum + (diet.nutrient.calories ?? 0.0)));

     setState(() {
       isSuccess = true;
     });

    });



  }

  @override
  Widget build(BuildContext context) {
    return
    Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(35), // 여기서 숫자를 조절하여 둥근 정도를 결정할 수 있습니다.
        ),
        child:
        isSuccess ?
        InkWell(
            onTap: () async {
              await showTodayDiet(context);
            },
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Text(
                            "식단",
                            style: TextStyle(
                              color: Color(0xA5222B45),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${totalCalories} Kal",
                            style: TextStyle(
                              color: Color(0xFF222B45),
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 13,
                          ),
                          CircleText(Palette.tanSu, 61, isOuter),
                          CircleText(Palette.danBaek, 100, isOuter),
                          CircleText(Palette.jiBang, 24, isOuter)
                        ]))))
    : Center(
            child: CircularProgressIndicator(
              color: Palette.mainSkyBlue,
            ))
    );
  }
}
