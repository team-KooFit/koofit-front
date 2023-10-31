import 'package:flutter/material.dart';
import 'package:koofit/model/config/palette.dart';

class UnivDietCard extends StatefulWidget {

  @override
  State<UnivDietCard> createState() => _UnivDietCardState();
}

class _UnivDietCardState extends State<UnivDietCard> {

  List<String> bokjiMenu = ["김치찌개", "된장찌개", "제육볶음", "불고기", "비빔밥"];
  List<String> beobgwanMenu = ["짜장면", "짬뽕", "볶음밥", "탕수육", "양장피"];
  List<String> gyojeokwonMenu = ["카레라이스", "김치볶음밥", "떡볶이", "라면", "샐러드"];
  List<String> selectedMenu = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedMenu = bokjiMenu; // 초기에 복지관 메뉴를 선택함

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
                // 자식 위젯을 가로 방향으로 가운데 정렬
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset('assets/images/healthy_food.png'),
                  ),
                  Text("오늘의 학식",
                    style: TextStyle(fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),),
                ],
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ToggleButtons(
                      children: [
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 13),
                            child: Text('복지관')
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 13),
                            child: Text('법학관')
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 13),
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


}