import 'package:flutter/material.dart';
import 'package:koofit/widget/advanced_calender_lib/advanced_calendar.dart';

class DietScreen extends StatefulWidget {
  const DietScreen({super.key});

  @override
  State<DietScreen> createState() => _DietScreenState();
}

class _DietScreenState extends State<DietScreen> {
  final _controller = AdvancedCalendarController.today();
  final events = <DateTime>[
    DateTime.now(),
    DateTime(2023, 10, 10),
    DateTime(2023, 10, 12),
    DateTime(2023, 10, 14),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Builder(builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Theme(
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
                controller: _controller,
                events: events,
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
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 21),
                    
              ),
            ),
          ],
        );
      }),
    );
  }
}
