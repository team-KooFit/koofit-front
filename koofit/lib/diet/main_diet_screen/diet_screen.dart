import 'package:flutter/material.dart';
import 'package:koofit/diet/fitness_screen/fitness_card.dart';
import 'package:koofit/diet/main_diet_screen/today_calories_card.dart';
import 'package:koofit/widget/advanced_calender_lib/advanced_calendar.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:koofit/model/config/palette.dart';
import 'univ_diet_card.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDateFormatting('ko', null);

  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Builder(builder: (context) {
        return SingleChildScrollView(
            child: Column(
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
            ) );
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
    return
      Padding(
        padding: EdgeInsets.all(15),
        child: Column(
            children: [
              Text(
                  formatDate(date),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 10)),
              UnivDietCard(),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              TodayCalorieCard(),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              FitnessCard(),
            ]
        )
    );
  }



  String formatDate(DateTime orgin_date) {
    var formatter = DateFormat(
        'yyyy년 M월 d일 (E)', 'ko'); // 'ko'는 한국어로 표시하기 위한 로케일 코드입니다.
    return formatter.format(orgin_date);
  }

  }