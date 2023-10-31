import 'package:flutter/material.dart';
import 'package:koofit/diet/add_diet_screen.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:get/get.dart';
class TodayCalorieCard extends StatefulWidget {

  @override
  State<TodayCalorieCard> createState() => _TodayCalorieCardState();
}

class _TodayCalorieCardState extends State<TodayCalorieCard> {


  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child:
        GestureDetector(
          onTap:  (){ Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDietScreen(), // 전달할 데이터를 포함하여 다음 스크린 생성
            ),
          );},

        child: Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            child:
            Padding(
                padding: EdgeInsets.all(15),
                child:
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10),
                      Text("식단",
                        style: TextStyle(
                          color: Color(0xA5222B45),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),),
                      SizedBox(height: 10,),
                      Text("0 Kal",
                        style: TextStyle(
                          color: Color(0xFF222B45),
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        )
                        ,),
                      SizedBox(height: 10,),
                      circleText(Palette.tanSu),
                      circleText(Palette.danBaek),
                      circleText(Palette.jiBang)
                    ]))
        ))
    );


  }

  Widget circleText(Color color){
    String text = "";

    if(color == Palette.tanSu){
      text = "탄";
    } else if(color == Palette.danBaek){
      text = "단";
    } else {
      text = "지";
    }

    return Padding(padding: EdgeInsets.symmetric(vertical: 5), child : Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle
          ),
        ),
        Padding(padding: EdgeInsets.all(5)),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xA5222B45),
            fontSize: 15,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        Padding(padding: EdgeInsets.all(5)),
        Text(
          '0 %',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xC6222B45),
            fontSize: 13,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),)
      ],
    ));
  }

  }