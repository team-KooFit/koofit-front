import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:koofit/model/config/palette.dart';

class AddDietBtnScreen extends StatefulWidget {
  final String where;
  final String menu;

  // 생성자 정의
  AddDietBtnScreen({Key? key, required this.where, required this.menu})
      : super(key: key);

  @override
  State<AddDietBtnScreen> createState() => _AddDietBtnScreenState();
}

class _AddDietBtnScreenState extends State<AddDietBtnScreen> {
  // late var _defaultValue;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await _showNutrientSheet(context, widget.where, widget.menu);
        },
        child: Text('+',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
            )),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(90, 20),
            backgroundColor: Palette.mainSkyBlue,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            // 내부 패딩 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))));
  }

  Future<void> _showNutrientSheet(
      BuildContext context, String where, String menu) async {
    await showModalBottomSheet<void>(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      useSafeArea: true,
      enableDrag: true,
      isScrollControlled: true,
      elevation: 50,
      constraints: const BoxConstraints(
        minWidth: double.infinity,
        maxHeight: 730,
      ),
      builder: (BuildContext context) {
        return ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 35),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  Text(
                    "${widget.where}",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    menu,
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                        color: Colors.black54),
                  ),
                  SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                  Card(
                    color: Color(0xFFEFEFEF),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // 모서리를 둥글게 만드는 값 설정
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // 시작에 배치
                          children: [
                            Text(
                              "887Kcal",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black45,
                              ),
                            ),
                            Divider(
                              color: Colors.black12, // 가로선의 색상 설정
                              thickness: 1, // 가로선의 두께 설정
                              height: 20, // 가로선의 높이 설정
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "탄수화물",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "74g",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "당류",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.black45),
                                    ),
                                    Text(
                                      "10g",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.black45),
                                    ),
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "식이섬유",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.black45),
                                    ),
                                    Text(
                                      "10g",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          color: Colors.black45),
                                    ),
                                  ]),
                            ),
                            Divider(
                              color: Colors.black12, // 가로선의 색상 설정
                              thickness: 1, // 가로선의 두께 설정
                              height: 20, // 가로선의 높이 설정
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "단백질",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "24g",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ]),
                            ),
                            Divider(
                              color: Colors.black12, // 가로선의 색상 설정
                              thickness: 1, // 가로선의 두께 설정
                              height: 20, // 가로선의 높이 설정
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "지방",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                    Text(
                                      "19g",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15),
                                    ),
                                  ]),
                            ),
                          ]),
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.mainSkyBlue),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('수정하기',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20)),
                      ))
                ],
              ),
            ));
      },
    );
  }
}
