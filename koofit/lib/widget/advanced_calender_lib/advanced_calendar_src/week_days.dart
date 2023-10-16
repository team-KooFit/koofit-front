part of 'widget.dart';

/// Week day names line.
class WeekDays extends StatelessWidget {
  const WeekDays({
    Key? key,
    this.weekNames = const <String>['월', '화', '수', '목', '금', '토', '일'],
    this.style,
    required this.keepLineSize,
  })  : assert(weekNames.length == 7, '`weekNames` must have length 7'),
        super(key: key);

  /// Week day names.
  final List<String> weekNames;

  /// Text style.
  final TextStyle? style;

  final bool keepLineSize;

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: style!,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(weekNames.length, (index) {
          return DateBox(
            child: Text(
              weekNames[index],
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          );
        }),
      ),
    );
  }
}
