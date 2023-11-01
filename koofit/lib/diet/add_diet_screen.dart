import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:koofit/model/config/palette.dart';

class AddDietBtnScreen extends StatefulWidget {
  final String where;
  final String menu;

  // 생성자 정의
  AddDietBtnScreen({Key? key, required this.where, required this.menu}) : super(key: key);

  @override
  State<AddDietBtnScreen> createState() => _AddDietBtnScreenState();
}

class _AddDietBtnScreenState extends State<AddDietBtnScreen> {
  // late var _defaultValue;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        await _showBottomSheet(context, widget.where, widget.menu);
      },
        child: Text(
            '+',
            style:
            TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w800,
            )
        ),
        style: ElevatedButton.styleFrom(
            minimumSize: Size(70,20),
            backgroundColor: Palette.mainSkyBlue,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 2), // 내부 패딩 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))
        ));
  }

  Future<void> _showBottomSheet(BuildContext context, String where, String menu) async {
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
        maxHeight: 695,
      ),
      builder: (BuildContext context) {
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: 15),
              Text("복지관", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
              SizedBox(height: 5),
              Text(menu, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w300, color: Colors.black54),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
