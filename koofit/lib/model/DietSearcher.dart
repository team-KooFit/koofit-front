import 'dart:convert';
import 'dart:io';

class DietSearcher {
  final String searchDate;
  late Map<String, dynamic> resultDiet;

  DietSearcher(this.searchDate);

  Future<Map<String, dynamic>> searchMenuByDate(
      Map<String, dynamic> data, String date) async {
    Map<String, dynamic> result;

    if (data.containsKey(date)) {
      result = data[date]!;
    } else {
      result = {'error': '$date 날짜에 메뉴가 없습니다.'};
    }

    print("--------------------------");
    if (result is Map<String, dynamic>) {
      print("날짜 $searchDate의 메뉴 정보:");
      result.forEach((restaurant, menu) {
        print('$restaurant: $menu');
      });
    } else if (result is String) {
      print("에러: $result");
    }
    return result;
  }

  Future<Map<String, dynamic>> performDietSearch() async {
    Map<String, Map<String, Map<String, String>>> transformedData = {};
    DateTime today = DateTime.now();
    String todayDate = today.toLocal().toString().split(' ')[0];
    DateTime firstDayOfMonth = DateTime(today.year, today.month, 1);
    DateTime lastDayOfMonth = DateTime(today.year, today.month + 1, 0);

    String formattedFirstDay =
        '${firstDayOfMonth.year}-${firstDayOfMonth.month.toString().padLeft(2, '0')}-${firstDayOfMonth.day.toString().padLeft(2, '0')}';
    String formattedLastDay =
        '${lastDayOfMonth.year}-${lastDayOfMonth.month.toString().padLeft(2, '0')}-${lastDayOfMonth.day.toString().padLeft(2, '0')}';

    String url =
        'https://kmucoop.kookmin.ac.kr/menu/menujson.php?callback=jQuery112408319456905698375_1699929495522&sdate=$formattedFirstDay&edate=$formattedLastDay&today=$todayDate&_=${DateTime.now().millisecondsSinceEpoch}';

    try {
      HttpClientRequest request = await HttpClient().getUrl(Uri.parse(url));
      HttpClientResponse response = await request.close();

      String responseData = await utf8.decodeStream(response);
      RegExp regExp = RegExp(r'\((.*)\)');
      Match? match = regExp.firstMatch(responseData);

      if (match != null) {
        String jsonStr = match.group(1)!;

        Map<String, dynamic> originalData = json.decode(jsonStr);

        originalData.forEach((restaurant, dateCornerMenu) {
          dateCornerMenu.forEach((date, cornerMenu) {
            transformedData.putIfAbsent(date, () => {});
            transformedData[date]!.putIfAbsent(restaurant, () => {});

            Map<String, dynamic> currentMap =
                transformedData[date]![restaurant]!;

            cornerMenu.forEach((key, value) {
              if (value is String) {
                currentMap[key] = value;
              } else if (value is Map<String, dynamic>) {
                currentMap[key] = json.encode(value);
              } else {
                print("Unhandled type for key '$key': ${value.runtimeType}");
              }
            });
          });
        });

        return searchMenuByDate(transformedData, searchDate);
      } else {
        print("JSON 데이터를 찾을 수 없습니다.");
      }
    } catch (error) {
      print("오류가 발생했습니다: $error");
    }

    return {}; // Return an empty map if there is an error
  }
}
//
// void main() async {
//   String searchDate = '2023-11-16';
//   DietSearcher dietSearcher = DietSearcher(searchDate);
//   Map<String, dynamic> result = await dietSearcher.performDietSearch();
//   print(result);
// }
