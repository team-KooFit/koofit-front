import 'package:flutter/material.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/model/data/food.dart';

class DetailsPage extends StatefulWidget {
  final List<String> rowData;

  DetailsPage({required this.rowData});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  Food? food;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (widget.rowData.length >= 21) {
      food = Food(
        foodCode: widget.rowData[0],
        foodName: widget.rowData[1],
        manufacturer: widget.rowData[2],
        foodWeight: double.tryParse(widget.rowData[14]),
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
            onPressed: () {
              print(widget.rowData);
              // 아이콘 버튼이 눌렸을 때 수행할 동작 추가
              print('Settings button pressed');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5),
            _buildTile('식품명', '${food!.foodName }'),
            _buildTile('식품 중량(g)', '${food?.foodWeight?? '정보없음'}'),
            _buildTile('에너지(kcal)', '${food!.calories ?? '정보없음'}'),
            _buildTile('탄수화물(g)', '${food?.carbo ?? '정보없음'}'),
            _buildTile('당류(g)', '${food?.sugar ?? '정보없음'}'),
            _buildTile('단백질(g)', '${food?.protein ?? '정보없음'}'),
            _buildTile('지방(g)', '${food?.fat ?? '정보없음'}'),
          ],
        ),
      ),
    );
  }

  Widget _buildTile(String title, String value) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 2.0,
            child: ListTile(
                title: Row(children: [
              Text('${title}  : ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text(value, style: TextStyle(fontSize: 15))
            ]))));
  }
}
