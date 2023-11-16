import 'package:flutter/material.dart';
import 'package:koofit/model/config/palette.dart';

class CalText extends StatelessWidget {
  final int? realKol;
  final int? goalKol;

  CalText(this.realKol, this.goalKol);

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text('$realKol',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(' / $goalKol', style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black38)),
          SizedBox(width: 10),
          Text(
            'kcal',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xC6222B45),
              fontSize: 13,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}