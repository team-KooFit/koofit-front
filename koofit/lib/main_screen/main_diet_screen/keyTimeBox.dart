import 'package:flutter/material.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/model/data/diet.dart';
import 'package:koofit/widget/RectangleText.dart';

class keyTimeBox extends StatefulWidget {
  final String keyTime;
  final List<Diet> keyTimeDietList;

  const keyTimeBox(
      {super.key, required this.keyTime, required this.keyTimeDietList});

  @override
  State<keyTimeBox> createState() => _keyTimeBoxState();
}

class _keyTimeBoxState extends State<keyTimeBox> {
  List<Diet> keyTimeDiets = [];

  int totalCalories = 0;
  int totalCarbo = 0;
  int totalProtein = 0;
  int totalFat = 0;

  String keyTime = '';
  List<Row> morningRows = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    keyTime = widget.keyTime;
    print(keyTime);
    keyTimeDiets = widget.keyTimeDietList
        .where((diet) => diet.keyTime == widget.keyTime)
        .toList();

    // 총칼로리 data 추출, 탄단지 섭취율 계산
    totalCalories = (keyTimeDiets.fold<int>(
        0, (sum, diet) => sum + (diet.nutrient.calories?.toInt() ?? 0)));
    totalCarbo = (keyTimeDiets.fold<int>(
        0, (sum, diet) => sum + (diet.nutrient.carbo?.toInt() ?? 0)));
    totalProtein = (keyTimeDiets.fold<int>(
        0, (sum, diet) => sum + (diet.nutrient.protein?.toInt() ?? 0)));
    totalFat = (keyTimeDiets.fold<int>(
        0, (sum, diet) => sum + (diet.nutrient.fat?.toInt() ?? 0)));

    // morningDiets를 사용하여 Row 위젯을 생성합니다.
    morningRows = keyTimeDiets.map((diet) {
      return Row(
        children: [
          SizedBox(
            width: 140,
            child: FittedBox(
              alignment: Alignment.topLeft,
              fit: BoxFit.scaleDown,
              child: Text(
                '${diet.foodName}',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xC6222B45),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          SizedBox(
            width: 50,
            child: FittedBox(
              alignment: Alignment.topRight,
              fit: BoxFit.scaleDown,
              child: Text(
                '${diet.nutrient.calories!.toInt()} kcal',
                textAlign: TextAlign.right,
                style: TextStyle(
                  color: Color(0xc6222B45),
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        width: double.infinity,
        child: IntrinsicHeight(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: Container(
              width: 140,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              decoration: BoxDecoration(
                color: Palette.mainSkyBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  bottomLeft: Radius.circular(20.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Image.asset('assets/images/healthy_food.png'),
                  ),
                  Text(
                    "$keyTime",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                ],
              ),
            )),
            Container(
              width: 230,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              decoration: BoxDecoration(
                color: Color(0xEFCFCFAEE),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15.0),
                  bottomRight: Radius.circular(15.0),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // Align children to both ends
                    children: [
                      Text(
                        "총 칼로리",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      Text(
                        '$totalCalories kcal',
                        style: TextStyle(
                          color: Color(0xC6222B45),
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ...morningRows,
                  SizedBox(height: 10),
                  Row(
                    children: [
                      RectangleText(
                        Palette.tanSu,
                        realGram: totalCarbo,
                      ),
                      SizedBox(width: 10),
                      RectangleText(
                        Palette.danBaek,
                        realGram: totalProtein,
                      ),
                      SizedBox(width: 10),
                      RectangleText(
                        Palette.jiBang,
                        realGram: totalFat,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
