import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:koofit/main_screen/add_diet_screen.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/model/DietSearcher.dart';

class UnivDietCard extends StatefulWidget {
  String selectedDate;
  // 생성자를 통해 selectedDate를 초기화할 수 있도록 변경
  UnivDietCard({required this.selectedDate});

  @override
  State<UnivDietCard> createState() => _UnivDietCardState();
}

class _UnivDietCardState extends State<UnivDietCard> {
  late Map<String, dynamic> result;
  Map<String, dynamic> bokjiMenu = {};
  Map<String, dynamic> beobgwanMenu = {};
  Map<String, dynamic> gyojeokwonMenu = {};
  Map<String, dynamic> selectedMenu = {};

  final GlobalKey<_UnivDietCardState> _univDietCardKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _initializeData().then((value) {
      bokjiMenu = result['학생식당(복지관 1층)'];
      beobgwanMenu = result['교직원식당(복지관 1층)'];
      gyojeokwonMenu = result['한울식당(법학관 지하1층)'];
    });


  }

  void updateData() {
    _initializeData();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.symmetric(vertical: 7)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset('assets/images/healthy_food.png'),
                ),
                Text(
                  "오늘의 학식",
                  style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ToggleButtons(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: Text('복지관'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: Text('법학관'),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 13),
                      child: Text('교직원'),
                    ),
                  ],
                  textStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  isSelected: [
                    selectedMenu == bokjiMenu,
                    selectedMenu == beobgwanMenu,
                    selectedMenu == gyojeokwonMenu,
                  ],
                  borderRadius: BorderRadius.circular(20.0),
                  constraints: const BoxConstraints(
                    minHeight: 30.0,
                    minWidth: 25.0,
                  ),
                  selectedBorderColor: Palette.mid_dark_mainSkyBlue,
                  selectedColor: Colors.white,
                  fillColor: Palette.mid_dark_mainSkyBlue,
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
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),

            if (selectedMenu.isNotEmpty)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: selectedMenu.entries.map((entry) {
                    String menuKey = entry.key;
                    dynamic jsonString = entry.value;
                    // 백슬래시 이스케이프 처리 및 줄바꿈 문자(\n)로 치환
                    String cleanedString = jsonString.replaceAll(r'\\r\\n', '\r\n');
                    // JSON 디코딩
                    Map<String, dynamic> MenuMap = json.decode(cleanedString);
                    print(MenuMap);
                    // Create a list to store widgets for each key-value pair in menuValue
                    List<Widget> keyValueWidgets = [];

                    // Iterate through entries in menuValue
                    for (var key in MenuMap.keys) {
                      dynamic value = MenuMap[key];

                      // Add widgets for key and value
                      keyValueWidgets.add(
                        Column(

                          children: [
                            Text(key),
                            SizedBox(height: 8),
                            Text('$value'),
                          ],
                        ),
                      );
                    }
                    return Card(
                      color: Color(0xFFF2F3F3),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Text(menuKey),
                            SizedBox(height: 8),
                            // Display widgets for each key-value pair in menuValue
                            ...keyValueWidgets,
                            SizedBox(height: 8),
                            AddDietBtnScreen(
                              where: "식당이름",
                              menu: selectedMenu[menuKey],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
          ],
        ),
      ),
    );
  }

  Future<void> _initializeData() async {
    print(111111111111);
    print(widget.selectedDate);
    DietSearcher dietSearcher = DietSearcher(widget.selectedDate);
    result = await dietSearcher.performDietSearch();
  }
}
