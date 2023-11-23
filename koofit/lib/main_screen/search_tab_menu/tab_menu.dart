import 'package:flutter/material.dart';
import 'package:koofit/main_screen/search_tab_menu/tab_kmu_screen.dart';
import 'package:koofit/model/config/palette.dart';

class TabMenu extends StatefulWidget {
  const TabMenu({Key? key}) : super(key: key);

  @override
  State<TabMenu> createState() => _TabMenuState();
}

class _TabMenuState extends State<TabMenu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2, // Number of tabs
        child: Column(children: [
          TabBar(
            tabs: [
              Tab(text: "KMU"),
              Tab(text: '즐겨찾기'),
              // Tab(text: '직접 입력'),
            ],
            labelColor: Colors.black87,
            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            dividerColor: Palette.mainSkyBlue,
            indicatorColor: Palette.mainSkyBlue,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.all(5), // 인디케이터 패딩 설정 (원하는 크기로 조절)
          ),
          Expanded(
            child: TabBarView(
              children: [
                // Content for Tab 1
                TabKmuScreen(),
                // Content for Tab 2
                Text('Tab 2 Content'),
                // Content for Tab 3
                // Text('Tab 3 Content')
              ],
            ),
          )
        ]));
  }
}
