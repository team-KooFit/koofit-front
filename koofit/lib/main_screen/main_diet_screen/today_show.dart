import 'package:flutter/material.dart';
import 'package:koofit/main_screen/main_diet_screen/today_calories_card.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/widget/MacroNutrientGraph.dart';
import 'package:koofit/widget/circleText.dart';
import 'package:koofit/widget/calText.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:koofit/widget/RectangleText.dart';
import 'package:koofit/widget/oneGraph.dart';

Future<void> showTodayDiet(BuildContext context) async {

  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.jumpTo(1);
  }

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
      maxHeight: 600,
    ),
    builder: (BuildContext context) {
      return ClipRRect(
              borderRadius : BorderRadius.only(
                topLeft : Radius.circular(20),
                topRight : Radius.circular(20),
              ),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 35),
                child : Column(
                  children: <Widget>[
                    Text("오늘의 식단을 기록해볼까요?", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 35),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                    Card(

                      color: Color(0xFFEFEFEF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30), // 모서리를 둥글게 만드는 값 설정
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child:  Column(
                          crossAxisAlignment: CrossAxisAlignment.center, // 시작에 배치
                          children: [
                            nutrientBox(),
                            todayBox(),
                            oneGraph(
                              carbPercentage : 50.0,
                              fatPercentage : 30.0,
                              proteinPercentage : 20.0,
                            ),

                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            );}

        );


}

Widget todayGraphCard(){
  return Card(
    color: Color(0xFFEFEFEF),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10), // 모서리를 둥글게 만드는 값 설정
    ),

    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,// 시작에 배치
        children: [],
      ),
    ),
  );

}

Widget nutrientBox(){
  int remainKol = 1388;
  return Padding(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        CircleText(Palette.tanSu, 61, false, realGram: 32, goalGram: 200,),
        CircleText(Palette.danBaek, 100, false, realGram: 120, goalGram: 120,),
        CircleText(Palette.jiBang, 24, false, realGram: 6, goalGram: 36,),
        CalText(215, 1603),
        Text('$remainKol kcal 더 먹을 수 있어요',
          textAlign : TextAlign.left,
          style : TextStyle(
            color : Color(0xC6222B45),
            fontSize : 14,
            fontFamily : 'Poppins',
            fontWeight : FontWeight.w700,
          ),
        ),
        SizedBox(height:10),
        ElevatedButton(
          onPressed:() async {

          },
          child : Text(
            '+',
            style : TextStyle(
              color : Colors.white,
              fontSize : 18,
              fontFamily:'Inter',
              fontWeight:FontWeight.w800,
            ),
          ),
          style : ElevatedButton.styleFrom(
            minimumSize:Size(500,20),
            backgroundColor:Palette.mainSkyBlue,
            padding:EdgeInsets.symmetric(vertical:8, horizontal:2),
            shape:RoundedRectangleBorder(
              borderRadius:BorderRadius.circular(15),
            ),
          ),
        ),
      ],
    ),
  );


}

Widget todayBox() {
  int totalCal = 205;
  int eggCal = 65;
  int appleCal = 142;
  return
    Container(
        width: double.infinity,
        height: 140,
        child: Row(
          mainAxisAlignment : MainAxisAlignment.start,
          children: [
            Container(
              padding : EdgeInsets.symmetric(horizontal : 15, vertical : 15),
              decoration : BoxDecoration(
                color : Palette.mainSkyBlue,
                borderRadius : BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child : Column(
                mainAxisAlignment : MainAxisAlignment.center,
                children : [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/images/healthy_food.png'),
                  ),
                  Text("아침",
                    style: TextStyle(fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),),
                ],
              ),
            ),
            Container(
              padding : EdgeInsets.symmetric(horizontal : 10, vertical : 10),
              decoration : BoxDecoration(
                color : Color(0xEFCFCFAEE),
                borderRadius : BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  bottomRight: Radius.circular(20.0),
                ),
              ),
              child :
              Column(
                mainAxisAlignment : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children : [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, // Align children to both ends
                    children : [
                      Text("계란 외 한 개",
                        style : TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      SizedBox(width: 75),
                      Text('$totalCal kcal',
                        style : TextStyle(
                          color : Color(0xC6222B45),
                          fontSize : 14,
                          fontWeight : FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 3),

                  Row(
                    children : [
                      Text('계란',
                        textAlign : TextAlign.left,
                        style : TextStyle(
                          color : Color(0xC6222B45),
                          fontSize : 15,
                          fontWeight : FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 77),
                      Text('$eggCal kcal',
                        textAlign : TextAlign.right,
                        style : TextStyle(
                          color : Color(0xc6222B45),
                          fontSize : 15,
                          fontWeight : FontWeight.w500,
                        ),),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    children : [
                      Text('사과',
                        style : TextStyle(
                          color : Color(0xC6222B45),
                          fontSize : 15,
                          fontWeight : FontWeight.w500,
                        ),
                      ),
                      SizedBox(width: 70),
                      Text('$appleCal kcal',
                        style : TextStyle(
                          color : Color(0xc6222B45),
                          fontSize : 15,
                          fontWeight : FontWeight.w500,
                        ),),
                    ],
                  ),
                  SizedBox(height: 3),
                  Row(
                    children : [
                      RectangleText(Palette.tanSu, realGram: 30.9,),
                      SizedBox(width: 10),
                      RectangleText(Palette.danBaek, realGram: 14,),
                      SizedBox(width: 10),
                      RectangleText(Palette.jiBang, realGram: 34,),
                    ],
                  ),
                  MacroNutrientGraph(
                    carbPercentage : 50.0,
                    fatPercentage : 30.0,
                    proteinPercentage : 20.0,
                  ),

                ],
              ),
            ),
          ],
        ) );
}