import 'package:flutter/material.dart';
import 'package:koofit/model/config/palette.dart';

class DetailsPage extends StatelessWidget {
  final List<String> rowData;

  DetailsPage({required this.rowData});

  @override
  Widget build(BuildContext context) {

    print(rowData);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainSkyBlue,
        title: Text('영양성분',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      )),
      body: ListView.builder(
        itemCount: rowData.length,
        itemBuilder: (context, index) {
          switch (index) {
            case 1:
              return _buildCard('식품명 :', rowData[index]);
              break;

            case 2:
              return _buildCard('제조사명 :', rowData[index]);
              break;

            case 14:
              return _buildCard('식품중량 :', rowData[index]);
              break;

            case 16:
              return _buildCard('에너지(kcal) :', rowData[index]);
              break;

            case 17:
              return _buildCard('단백질(g) :', rowData[index]);
              break;

            case 18:
              return _buildCard('지방(g) :', rowData[index]);
              break;

            case 19:
              return _buildCard('탄수화물(g) :', rowData[index]);
              break;

            case 20:
              return _buildCard('당류(g) :', rowData[index]);
              break;
          }
          return Container();
        },
      ),
    );
  }

  Widget _buildCard(String leadingText, String titleText) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2.0,
      child: ListTile(
        leading: Text(
          leadingText,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
        ),
        title: Text(titleText,
          style: TextStyle(fontSize: 14),
          textAlign: TextAlign.start,),
      ),
    ));
  }
}



// if (index == 0 || index == 3 ) {
// return ListTile(
// leading: Text(
// 'index $index',
// ),
// title: Text(rowData[index]),
// );
// }