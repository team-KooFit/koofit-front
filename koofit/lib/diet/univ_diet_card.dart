import 'package:flutter/material.dart';
import 'package:koofit/model/config/palette.dart';

class DietCard extends StatelessWidget {
  final String day;

  DietCard({required this.day});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // 카드의 너비 조절
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );
  }
}