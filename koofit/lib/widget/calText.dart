import 'package:flutter/material.dart';

class CalText extends StatelessWidget {
  final int? realKol;
  final int? goalKol;

  const CalText(this.realKol, this.goalKol, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Text('$realKol',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          Text(' / $goalKol', style: const TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black38)),
          const SizedBox(width: 10),
          const Text(
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