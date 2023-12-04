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
  int num=1;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.rowData.length >= 21) {
      food = Food(
        foodCode: widget.rowData[0],
        foodName: widget.rowData[1],
        manufacturer: widget.rowData[2],
        foodWeight: widget.rowData[14],
        calories: double.tryParse(widget.rowData[16]) ?? 0.0,
        protein: double.tryParse(widget.rowData[17])?? 0.0,
        fat: double.tryParse(widget.rowData[18])?? 0.0,
        carbo: double.tryParse(widget.rowData[19])?? 0.0,
        sugar: double.tryParse(widget.rowData[20])?? 0.0,
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
            _buildTile('식품 중량(g)', '${food?.foodWeight != null ? (double.parse(widget.rowData[14].replaceAll('g', ''))) * num : '정보없음'}'),
            _buildTile('에너지(kcal)', '${food!.calories != null ? (double.parse(widget.rowData[16])) * num : '정보없음'}'),
            _buildTile('탄수화물(g)', '${food?.carbo != null ? (double.parse(widget.rowData[19]) * num) : '정보없음'}'),
            _buildTile('당류(g)', '${food?.sugar != null ? (double.parse(widget.rowData[20])) * num : '정보없음'}'),
            _buildTile('단백질(g)', '${food?.protein != null ? (double.parse(widget.rowData[17])) * num : '정보없음'}'),
            _buildTile('지방(g)', '${food?.fat != null ? (double.parse(widget.rowData[18])) * num : '정보없음'}'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center, children: [
                DecoratedBox(
                    decoration: BoxDecoration(
                      color: Palette.mainSkyBlue,
                      border: Border.all(color:Palette.dark_mainSkyBlue,width: 1),
                      borderRadius: BorderRadius.circular(20),

                    ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: (){
                        print(widget.rowData);
                        if(num>1){
                          num--;
                        }
                        print(num);
                        setState(() {});
                      }, icon: Icon(
                        Icons.remove,
                        size: 29,
                      ),
                      ),
                      Text(
                        '$num',
                        style: TextStyle(fontSize: 29),
                      ),
                      IconButton(
                        onPressed: (){
                          print(widget.rowData);
                          num++;
                          print(num);
                          setState(() {});
                        }, icon: Icon(
                        Icons.add,
                        size: 29,
                      ),
                      ),

                    ],
                  ),
                )
            ],
            ),
            SizedBox(height :10),
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
    double updatedValue = double.tryParse(value) ?? 0.0; // 문자열을 double로 변환하고 실패할 경우 0.0을 사용합니다.
    updatedValue *= num; // num 값을 곱해 업데이트합니다.

    // 업데이트된 값을 food 객체에 저장합니다.
    if (title == '식품 중량(g)') {
      food.foodWeight = updatedValue.toString();
    } else if (title == '에너지(kcal)') {
      food.calories = updatedValue;
    } else if (title == '탄수화물(g)') {
      food.carbo = updatedValue;
    } else if (title == '당류(g)') {
      food.sugar = updatedValue;
    } else if (title == '단백질(g)') {
      food.protein = updatedValue;
    } else if (title == '지방(g)') {
      food.fat = updatedValue;
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 2.0,
        child: ListTile(
          title: Row(
            children: [
              Text(
                '$title  : ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Text(
                updatedValue.toString(), // 업데이트된 값을 표시합니다.
                style: TextStyle(fontSize: 15),
                overflow: TextOverflow.fade,
              )
            ],
          ),
        ),
      ),
    );
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
