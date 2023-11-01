import 'package:flutter/material.dart';
import 'package:koofit/diet/add_diet_screen.dart';
import 'package:koofit/diet/search_diet_screen.dart';
import 'package:koofit/model/config/palette.dart';

class TabKmuScreen extends StatefulWidget {
  const TabKmuScreen({Key? key});

  @override
  State<TabKmuScreen> createState() => _TabKmuScreenState();
}

class _TabKmuScreenState extends State<TabKmuScreen> {
  List<String> bokjiMenu = ["김치찌개", "된장찌개", "제육볶음", "불고기", "비빔밥"];
  List<String> beobgwanMenu = ["짜장면", "짬뽕", "볶음밥", "탕수육", "양장피"];
  List<String> gyojeokwonMenu = ["카레라이스", "김치볶음밥", "떡볶이", "라면", "샐러드"];
  List<String> _selectedMenuItems = [];

  @override
  void initState() {
    super.initState();
    _selectedMenuItems = bokjiMenu; // 초기에 복지관 메뉴를 선택함
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WhereBtn(),
        Expanded(
          child: ListView.builder(
            itemCount: _selectedMenuItems.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(_selectedMenuItems[index]),
                trailing: AddDietBtnScreen(where: "식당이름", menu: _selectedMenuItems[index],)
              );
            },
          ),
        ),
      ],
    );
  }


  Widget WhereBtn(){
    return
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 10,),
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
              isSelected:    [
                _selectedMenuItems == bokjiMenu,
                _selectedMenuItems == beobgwanMenu,
                _selectedMenuItems == gyojeokwonMenu,],
              borderRadius: BorderRadius.circular(20.0),
              constraints: const BoxConstraints(
                minHeight: 25.0,
                minWidth: 40.0,
              ),
              selectedBorderColor: Palette.mid_dark_mainSkyBlue,
              selectedColor: Colors.white,
              fillColor:Palette.mid_dark_mainSkyBlue,
              color: Colors.black38,
              onPressed: (index) {
                setState(() {
                  if (index == 0) {
                    _selectedMenuItems = bokjiMenu;
                  } else if (index == 1) {
                    _selectedMenuItems = beobgwanMenu;
                  } else {
                    _selectedMenuItems = gyojeokwonMenu;
                  }
                });
              },
            ),
          ]
      );

  }

}
