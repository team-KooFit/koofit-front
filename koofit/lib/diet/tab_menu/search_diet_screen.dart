import 'package:flutter/material.dart';
import 'package:koofit/diet/tab_menu/tab_menu.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:easy_search_bar/easy_search_bar.dart';

class SearchDietScreen extends StatefulWidget {

  @override
  State<SearchDietScreen> createState() => _SearchDietScreenState();
}

class _SearchDietScreenState extends State<SearchDietScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  String searchValue = '';
  final List<String> _suggestions = ["짜장면", "짬뽕", "볶음밥", "탕수육", "양장피"];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
          appBar: EasySearchBar(
            backgroundColor: Palette.mainSkyBlue,
              title: const Text('식단 추가하기',
              style: TextStyle(fontWeight: FontWeight.bold,
              fontSize: 18),),
              onSearch: (value) => setState(() => searchValue = value),
              suggestions: _suggestions,
          ),


          body: Center(
              child:
              TabMenu()

          )
      );



  }

}