import 'package:flutter/material.dart';
import 'package:koofit/main_screen/main_diet_screen/today_show.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/widget/circleText.dart';

class TodayCalorieCard extends StatefulWidget {
  const TodayCalorieCard({super.key});


  @override
  State<TodayCalorieCard> createState() => _TodayCalorieCardState();
}

class _TodayCalorieCardState extends State<TodayCalorieCard> {

  bool isOuter = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(35), // 여기서 숫자를 조절하여 둥근 정도를 결정할 수 있습니다.
        ),
        child:
        InkWell(
    onTap: () async {
    await showTodayDiet(context);
    },

        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child:
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      const Text("식단",
                        style: TextStyle(
                          color: Color(0xA5222B45),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),),
                      const SizedBox(height: 5,),
                      const Text("0 Kal",
                        style: TextStyle(
                          color: Color(0xFF222B45),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                        ,),
                      const SizedBox(height: 13,),
                      CircleText(Palette.tanSu, 61, isOuter),
                      CircleText(Palette.danBaek, 100, isOuter ),
                      CircleText(Palette.jiBang, 24, isOuter)
                    ]))
        )
        )
    );


  }

  }