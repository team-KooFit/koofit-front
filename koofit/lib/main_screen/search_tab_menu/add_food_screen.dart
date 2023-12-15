import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:koofit/main_screen/main_diet_screen/diet_screen.dart';
import 'package:koofit/model/HiveDietHelper.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/model/data/diet.dart';
import 'package:koofit/model/data/food.dart';
import 'package:get/get.dart';

class AddFoodScreen extends StatefulWidget {
  final Food food;
  final String selectedDate;
  // 생성자 정의
  AddFoodScreen({
    Key? key,
    required this.food,
    required this.selectedDate
  }) : super(key: key);

  @override
  State<AddFoodScreen> createState() => _AddFoodScreenState();
}

class _AddFoodScreenState extends State<AddFoodScreen> {
  // late var _defaultValue;
  late String keyTime;
  bool isSuccess = false;
  final ValueNotifier<String> keyTimeNotifier = ValueNotifier<String>('아침');
  // int num=1;

  @override
  void initState() {
    super.initState();
    keyTime = '아침';
      print(DateTime.now());
  }
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          await _showNutrientSheet(context, widget.food);
        },
        child: Text('+',
            style: TextStyle(
              color: Colors.white,
              fontSize: 21,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
            )),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(50, 20),
            backgroundColor: Palette.mainSkyBlue,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2),
            // 내부 패딩 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))));
  }

  Future<void> _showNutrientSheet(BuildContext context, Food foodData) async {
    int num=1;
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
              color: Colors.white,
              padding: const EdgeInsets.only(left: 30, right: 30, bottom: 35),
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  Text(
                    "${foodData.foodName}",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
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
                        //     _datatile('칼로리', ${foodData.calories != null?((foodData.calories)*num)).toStringAsFixed(2):null});
                        // _datatile('칼로리', ${foodData.calories != null?((foodData.calories)*num)).toStringAsFixed(2):null});

                    Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "칼로리",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.black45),
                            ),
                            Text(
                                // '${food.foodWeight != null ? (double.parse(widget.rowData[14].replaceAll('g', ''))) * num : '정보없음'}'),
                      "${foodData.calories!=null?(foodData.calories)!*num:null}Kcal",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black45,
                              ),
                            ),
                      ],
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
                                      "${foodData.carbo}g",
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
                                      "${foodData.sugar}g",
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
                                      "${foodData.protein}g",
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
                                      "${foodData.fat}g",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecoratedBox(
                        decoration: BoxDecoration(
                          color: Palette.mainSkyBlue,
                          //background color of dropdown button
                          border: Border.all(color: Palette.mainSkyBlue, width: 1),
                          //border of dropdown button
                          borderRadius: BorderRadius.circular(
                              20), //border raiuds of dropdown button
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                // print(widget.rowData);
                                if (num > 1) {
                                  num--;
                                }
                                print(num);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.remove,
                                size: 29,
                              ),
                            ),
                            Text(
                              '$num',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            IconButton(
                              onPressed: () {
                                // print(widget.rowData);
                                num++;
                                print(num);
                                setState(() {});
                              },
                              icon: Icon(
                                Icons.add,
                                size: 29,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  keyTimeSelecter(),
                  Container(
                    // padding: EdgeInsets.symmetric(vertical: 10),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Palette.mainSkyBlue),
                        onPressed: () async {
                          print('Settings button pressed $keyTime');

                          saveFavoriteFoodToHiveBox(widget.food)
                              .then((value) => _showdialog(context, keyTime));
                        },
                        child: Text('저장하기',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ))
                ],
              ),
            ));
      },
    );
  }

  Future<dynamic> _showdialog(BuildContext context, String time) {
    return showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text('${time}', style: TextStyle(fontWeight: FontWeight.bold)),
        content: Text('저장되었습니다'),
        actions: [
          ElevatedButton(
              onPressed: () => Get.offAll(() => DietScreen()),
              child: Text('확인')),
        ],
      ),
    );
  }



  Future<void> saveFavoriteFoodToHiveBox(Food food) async {

    String date = widget.selectedDate;
    print("saveFavorite dateeeee !!!  $date");

    Diet diet = Diet(
        stuNumber: '111',
        date: date,
        keyTime: keyTime,
        foodName: food.foodName,
        nutrient: food);

    if (food != null) {
      HiveDietHelper().createDiet(diet).then((value) {
        isSuccess = true;
      });
    }
  }

  // Widget _datatile(String title, String value){
  //   if(title == '칼로리') {
  //     return Row(
  //       mainAxisAlignment:
  //       MainAxisAlignment.spaceBetween,
  //       children: [
  //         Text(
  //           '$title',
  //           style: TextStyle(
  //               fontWeight: FontWeight.bold,
  //               fontSize: 20,
  //               color: Colors.black45),
  //         ),
  //         Text(
  //           "${value}Kcal",
  //           style: TextStyle(
  //             fontWeight: FontWeight.bold,
  //             fontSize: 20,
  //             color: Colors.black45,
  //           ),
  //         ),
  //       ],
  //     );
  //   }
  //   else if(title == '탄수화물'){
  //
  //   }
  //     else if(title=='당류'){
  //     return Padding(
  //       padding: EdgeInsets.all(5),
  //       child: Row(
  //           mainAxisAlignment:
  //           MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               "당류",
  //               style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 13,
  //                   color: Colors.black45),
  //             ),
  //             Text(
  //               "${value}g",
  //               style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 13,
  //                   color: Colors.black45),
  //             ),
  //           ]
  //       ),
  //     );
  //   }
  //     else{
  //    return Container(
  //      Padding(
  //       padding: EdgeInsets.symmetric(vertical: 10),
  //       child: Row(
  //           mainAxisAlignment:
  //           MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text(
  //               "단백질",
  //               style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 15),
  //             ),
  //             Text(
  //               "${foodData.protein}g",
  //               style: TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   fontSize: 15),
  //             ),
  //           ],
  //       ),
  //     ),
  //   Divider(
  //   color: Colors.black12, // 가로선의 색상 설정
  //   thickness: 1, // 가로선의 두께 설정
  //   height: 20, // 가로선의 높이 설정
  //   ),
  //   }
  //
  // }

  Widget keyTimeSelecter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ValueListenableBuilder<String>(
          valueListenable: keyTimeNotifier,
          builder: (context, selectedValue, child) {
            return DecoratedBox(
              decoration: BoxDecoration(
                color: Palette.mainSkyBlue,
                border: Border.all(color: Palette.mainSkyBlue, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: DropdownButton(
                  iconSize: 20,
                  dropdownColor: Palette.mainSkyBlue,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  value: selectedValue,
                  items: [
                    DropdownMenuItem(value: '아침', child: Text('아침')),
                    DropdownMenuItem(value: '점심', child: Text('점심')),
                    DropdownMenuItem(value: '저녁', child: Text('저녁')),
                    DropdownMenuItem(value: '간식', child: Text('간식')),
                  ],
                  onChanged: (String? value) {
                    keyTimeNotifier.value = value ?? '아침';
                    keyTime = value ?? '아침';
                  },
                ),
              ),
            );
          },
        ),
        SizedBox(width: 10),
        Text(
          "에 먹었어요",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black38,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }

}
