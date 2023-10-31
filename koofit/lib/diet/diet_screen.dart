import 'package:flutter/material.dart';
import 'package:koofit/widget/advanced_calender_lib/advanced_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:koofit/model/config/palette.dart';
import 'univ_diet_card.dart';
import 'daily_diet_view.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  final thisController = AdvancedCalendarController.today();
  final recordedDay = <DateTime>[
    DateTime.now(),
    DateTime(2023, 10, 10),
    DateTime(2023, 10, 12),
    DateTime(2023, 10, 14),
  ];
  DateTime? _selectedDate; // 선택된 날짜를 저장할 변수


  List<bool> isSelected = [true, false, false]; // 초기 상태로 복지관 버튼을 눌러진 상태로 설정

  List<String> bokjiMenu = ["김치찌개", "된장찌개", "제육볶음", "불고기", "비빔밥"];
  List<String> beobgwanMenu = ["짜장면", "짬뽕", "볶음밥", "탕수육", "양장피"];
  List<String> gyojeokwonMenu = ["카레라이스", "김치볶음밥", "떡볶이", "라면", "샐러드"];
  List<String> selectedMenu = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting('ko', null);
    selectedMenu = bokjiMenu; // 초기에 복지관 메뉴를 선택함

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Builder(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            advanced_calender(theme, thisController, recordedDay),
            ValueListenableBuilder<DateTime>(
              valueListenable: thisController,
              builder: (context, selectedDate, child) {
                return DailyDietView(selectedDate);
              },
            ),
          ],
        );
      }),
    );
  }
    Widget advanced_calender(ThemeData theme, controller, recordedDay) {
      return Theme(
        data: theme.copyWith(
          textTheme: theme.textTheme.copyWith(
            titleMedium: theme.textTheme.titleMedium!.copyWith(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: const Color.fromARGB(255, 0, 0, 0),
            ),
            bodyLarge: theme.textTheme.bodyLarge!.copyWith(
              fontSize: 14,
              color: Colors.black54,
            ),
            bodyMedium: theme.textTheme.bodyMedium!.copyWith(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w200),
          ),
          // primaryColor: Palette.mainSkyBlue,
          // highlightColor: const Color.fromARGB(255, 179, 124, 124),
          disabledColor: Colors.grey[60],
        ),
        child: AdvancedCalendar(
          controller: controller,
          events: recordedDay,
          weekLineHeight: 45.0,
          startWeekDay: 1,
          innerDot: true,
          keepLineSize: true,
          calendarTextStyle: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            height: 1.3125,
            letterSpacing: 0,
          ),
          todayStyle: const TextStyle(
              color: Colors.white, fontWeight: FontWeight.w500, fontSize: 21),
        ),
      );
    }


  Widget DailyDietView(DateTime date) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Column(
            children: [
              Text(
                  formatDate(date),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              univDiet(),
              todayCalory(),
            ]
        )
    );
  }

  Widget univDiet() {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 7)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // 자식 위젯을 가로 방향으로 가운데 정렬
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/healthy_food.png'),
                ),
                 Text("오늘의 학식",
                  style: TextStyle(fontFamily: 'Poppins',
    fontWeight: FontWeight.bold,
    fontSize: 20),),
              ],
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              ToggleButtons(
                children: [
                  Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text('복지관')
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('법학관')
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('교직원')
                  ),
                ],
                textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                isSelected:    [ selectedMenu == bokjiMenu,
                selectedMenu == beobgwanMenu,
                selectedMenu == gyojeokwonMenu,],
                borderRadius: BorderRadius.circular(20.0),
                constraints: const BoxConstraints(
                  minHeight: 30.0,
                  minWidth: 25.0,
                ),
                selectedBorderColor: Palette.mid_dark_mainSkyBlue,
                selectedColor: Colors.white,
                fillColor:Palette.mid_dark_mainSkyBlue,
                color: Colors.black54,
                onPressed: (index) {
                  setState(() {
                    if (index == 0) {
                      selectedMenu = bokjiMenu;
                    } else if (index == 1) {
                      selectedMenu = beobgwanMenu;
                    } else {
                      selectedMenu = gyojeokwonMenu;
                    }
                  });
                },
              ),
                ]
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),

        if (selectedMenu.isNotEmpty)
    SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: selectedMenu
            .map(
              (menu) => Card(

                color: Color(0xFFF2F3F3), // 카드의 배경색을 #F2F3F3으로 설정
                elevation: 2, // 카드의 그림자 높이 설정
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15), // 모서리를 둥글게 만드는 값 설정
                ),

                child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(children: [
                Text(menu),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // TODO: + 버튼 눌렀을 때 수행할 작업 추가
                  },
                  child: Text(
                      '+',
                      style:
                        TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w800,
                        )
                  ),
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(70,20),
                      backgroundColor: Palette.mainSkyBlue,
                      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2), // 내부 패딩 조절
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))
                  )),
              ]),
            ),
          ),
        )
            .toList(),),),
            Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),

          ],
        ),
      ),
    );
  }

  Widget todayCalory(){

    return SizedBox(
        width: double.infinity,
        child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
    child: 
    Padding(
      padding: EdgeInsets.all(20),
      child:
      Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text("식단",
        style: TextStyle(
          color: Color(0xA5222B45),
          fontSize: 10,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
    ),),
      SizedBox(height: 10,),
      Text("0 Kal",
        style: TextStyle(
              color: Color(0xFF222B45),
              fontSize: 15,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
        )
        ,),

    ]))
    )
    );  }

  String formatDate(DateTime orgin_date) {
    var formatter = DateFormat(
        'yyyy년 M월 d일 (E)', 'ko'); // 'ko'는 한국어로 표시하기 위한 로케일 코드입니다.
    return formatter.format(orgin_date);
  }

}