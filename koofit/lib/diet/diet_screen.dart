import 'package:flutter/material.dart';
import 'package:koofit/widget/advanced_calender_lib/advanced_calendar.dart';
import 'package:intl/intl.dart';

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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Builder(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            advanced_calender(theme, thisController, recordedDay),
            Text(
                'Selected Date: ${_selectedDate != null ? DateFormat('yyyy-MM-dd').format(_selectedDate!) : 'No Date Selected'}'),
          ],
        );
      }),
    );
  }

  void _handleDateChanged(DateTime date) {
    setState(() {
      // 선택된 날짜가 변경될 때마다 UI를 업데이트합니다.
      _selectedDate = date;
    });
  }
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
            fontSize: 12, color: Colors.black87, fontWeight: FontWeight.w200),
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
