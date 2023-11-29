import 'package:flutter/material.dart';
import 'package:koofit/main_screen/main_diet_screen/diet_screen.dart';
import 'package:koofit/model/HiveDietHelper.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/model/data/food.dart';
import 'package:koofit/model/data/diet.dart';
import 'package:get/get.dart';


class DetailsPage extends StatefulWidget {
  final List<String> rowData;

  DetailsPage({required this.rowData});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late Food food;
  late Diet diet;
  bool isSuccess = false;
  String keyTime = '아침';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.rowData.length >= 21) {
      food = Food(
        foodCode: widget.rowData[0],
        foodName: widget.rowData[1],
        manufacturer: widget.rowData[2],
        foodWeight: widget.rowData[14],
        calories: double.tryParse(widget.rowData[16]),
        protein: double.tryParse(widget.rowData[17]),
        fat: double.tryParse(widget.rowData[18]),
        carbo: double.tryParse(widget.rowData[19]),
        sugar: double.tryParse(widget.rowData[20]),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.rowData);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainSkyBlue,
        title: Text(
          '영양성분',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              size: 29,
            ),
            onPressed: () async {
              print('Settings button pressed');
               saveFoodToHiveBox(food).then((value) =>  _showdialog(context, keyTime));

              ;
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5),
            _buildTile('식품명', '${food!.foodName}'),
            _buildTile('식품 중량(g)', '${food?.foodWeight ?? '정보없음'}'),
            _buildTile('에너지(kcal)', '${food!.calories ?? '정보없음'}'),
            _buildTile('탄수화물(g)', '${food?.carbo ?? '정보없음'}'),
            _buildTile('당류(g)', '${food?.sugar ?? '정보없음'}'),
            _buildTile('단백질(g)', '${food?.protein ?? '정보없음'}'),
            _buildTile('지방(g)', '${food?.fat ?? '정보없음'}'),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              DecoratedBox(
                  decoration: BoxDecoration(
                    color: Palette.mainSkyBlue,
                    //background color of dropdown button
                    border: Border.all(color: Palette.mainSkyBlue, width: 1),
                    //border of dropdown button
                    borderRadius: BorderRadius.circular(
                        20), //border raiuds of dropdown button

                  ),
                  child: Padding(
                      padding: EdgeInsets.only(left: 10, right: 10),
                      child: DropdownButton(
                        iconSize: 25,
                        dropdownColor: Palette.mainSkyBlue,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold, color: Colors.white),
                        value: keyTime,
                        items: [
                          DropdownMenuItem(value: '아침', child: Text('아침')),
                          DropdownMenuItem(value: '점심', child: Text('점심')),
                          DropdownMenuItem(value: '저녁', child: Text('저녁')),
                          DropdownMenuItem(value: '간식', child: Text('간식')),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            keyTime = value!;
                            print("keyTime ${keyTime}");
                          });
                        },
                      ))),
              SizedBox(width: 10),
              Text(
                "에 먹었어요",
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.black38,
                    fontWeight: FontWeight.bold),
              )
            ])
          ],
        ),
      ),
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
              onPressed: () =>  Get.offAll(() => DietScreen()),
              child: Text('확인')),
        ],
      ),
    );
  }


  Widget _buildTile(String title, String value) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Card(
            color: Colors.white,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 2.0,
            child: ListTile(
                title: Row(children: [
                  Text('${title}  : ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  Text(
                    value,
                    style: TextStyle(fontSize: 15),
                    overflow: TextOverflow.fade,
                  )
                ]))));
  }

  Future<void> saveFoodToHiveBox(Food food) async {
    diet = Diet(
        stuNumber: '111',
        date: DateTime.now().toLocal().toString().split(' ')[0],
        keyTime: keyTime,
        foodName: food.foodName,
        nutrient: food);

    if (food != null) {
      // Get or open the Hive box (replace 'foodBox' with your desired box name)

      // Save the Food object to the box

      HiveDietHelper().createDiet(diet).then((value) {
        isSuccess = true;
      });

      HiveDietHelper().readDiet().then((value) {});
    }
  }
}
