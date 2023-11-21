import 'package:flutter/material.dart';
import 'package:koofit/main_screen/main_diet_screen/today_calories_card.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/widget/circleText.dart';

Future<void> showTodayDiet(BuildContext context) async {
  await showModalBottomSheet<void>(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    useSafeArea: true,
    enableDrag: true,
    isScrollControlled: true,
    elevation: 50,
    constraints: const BoxConstraints(
      minWidth: double.infinity,
      maxHeight: 697,
    ),
    builder: (BuildContext context) {
      return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Container(
            padding:
                const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 35),
            child: Column(
              children: <Widget>[
                Text(
                  "오늘의 식단을 기록해볼까요?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [],
                ),
                Card(
                  color: Color(0xFFEFEFEF),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(30), // 모서리를 둥글게 만드는 값 설정
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start, // 시작에 배치
                        children: [nutrientBox()]),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ));
    },
  );
}

Widget todayGraphCard() {
  return Card(
      color: Color(0xFFEFEFEF),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 만드는 값 설정
      ),
      child: Padding(padding: EdgeInsets.all(30.0), child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // 시작에 배치
          children: [])));
}

Widget nutrientBox() {
  return Padding(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        CircleText(
          Palette.tanSu,
          61,
          false,
          realGram: 32,
          goalGram: 200,
        ),
        CircleText(
          Palette.danBaek,
          100,
          false,
          realGram: 120,
          goalGram: 120,
        ),
        CircleText(
          Palette.jiBang,
          24,
          false,
          realGram: 6,
          goalGram: 36,
        ),
      ],
    ),
  );
}
