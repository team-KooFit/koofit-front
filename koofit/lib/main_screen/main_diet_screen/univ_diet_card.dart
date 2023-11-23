import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:koofit/main_screen/search_tab_menu/add_diet_screen.dart';
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

  int clickedBtnIndex = 0;
  String btnText = '';
  List<String> btnTxtList = ['복지관', '법학관', '교직원'];

  String menuText = '';

  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.jumpTo(1);
  }



  @override
  void initState() {
    super.initState();
    _updateData(widget.selectedDate);
  }

  @override
  void didUpdateWidget(covariant UnivDietCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedDate != widget.selectedDate) {
      _updateData(widget.selectedDate);
    }
  }

  void _updateData(String date) async {
    DietSearcher dietSearcher = DietSearcher(date);
    result = await dietSearcher.performDietSearch();
    print(result['학생식당(복지관 1층)']);
    setState(() {
      bokjiMenu = result['학생식당(복지관 1층)'] ?? {'식당' :  {"메뉴" : "운영 안함" , "가격" : "없음"}} ;
      beobgwanMenu = result['교직원식당(복지관 1층)'] ?? {'식당' :  {"메뉴" : "운영 안함" , "가격" : "없음"}};
      gyojeokwonMenu = result['한울식당(법학관 지하1층)'] ?? {'식당' : {"메뉴" : "운영 안함" , "가격" : "없음"}};
      // Set the initial selectedMenu to 복지관
      selectedMenu = bokjiMenu;


    });
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
                  textStyle:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
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
                      btnText = btnTxtList[index];
                      if (index == 0) {
                        selectedMenu = bokjiMenu;
                      } else if (index == 1) {
                        selectedMenu = beobgwanMenu;
                      } else {
                        selectedMenu = gyojeokwonMenu;
                      }

                      _scrollToTop(); // Reset scroll position

                    });
                  },
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            if (selectedMenu.isNotEmpty)
              SingleChildScrollView(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: selectedMenu.entries.map((entry) {
                    String menuKey = entry.key.replaceAll(RegExp(r'<br>', caseSensitive: false), '-');
                    dynamic jsonString = entry.value;
                    // 백슬래시 이스케이프 처리 및 줄바꿈 문자(\n)로 치환

                    String cleanedString =  jsonString.replaceAll('\\r\n', '\r\n') ;
                    Map<String, dynamic> menuMap = json.decode(cleanedString);
                    String menuText = menuMap['메뉴'] ?? '';
                    // Create a list to store widgets for each key-value pair in menuValue
                    List<Widget> keyValueWidgets = [];
                    // Iterate through entries in menuValue

                    keyValueWidgets.add(
                        Container(
                            padding: EdgeInsets.all(8),
                            width: 130,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Colors.white54,
                              borderRadius:
                                  BorderRadius.circular(10.0), // 둥근 모서리 설정
                            ),
                            child:
                              SingleChildScrollView(
                                child: Text('${menuText}',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.w400,
                                        fontSize: 12)))
                        )
                    );


                    if (menuText == '') {
                      return Container();
                    }
                    return Card(
                      color: Color(0xFFF2F3F3),
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            children: [
                              SizedBox(height: 15),
                              Text(
                                menuKey,
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black54),
                              ),
                              SizedBox(height: 8),
                              ...keyValueWidgets,
                              SizedBox(height: 8),
                              AddDietBtnScreen(
                                where: btnText,
                                menu: menuText,
                              ),
                              SizedBox(height: 15),
                            ],
                          )),
                    );
                  }).toList(),
                ),
              ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          ],
        ),
      ),
    );
  }
}
