// import 'package:flutter/material.dart';
//
// class keyTimeBox extends StatefulWidget {
//   const keyTimeBox({super.key});
//
//   @override
//   State<keyTimeBox> createState() => _keyTimeBoxState();
// }
//
// class _keyTimeBoxState extends State<keyTimeBox> {
//
//   int totalCal = 205;
//   int eggCal = 65;
//   int appleCal = 142;
//   @override
//   Widget build(BuildContext context) {
//
//     return Container(
//         margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//         width: double.infinity,
//         height: 140,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
//               decoration: BoxDecoration(
//                 color: Palette.mainSkyBlue,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(20.0),
//                   bottomLeft: Radius.circular(20.0),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Image.asset('assets/images/healthy_food.png'),
//                   ),
//                   Text(
//                     "아침",
//                     style: TextStyle(
//                         fontFamily: 'Poppins',
//                         fontWeight: FontWeight.bold,
//                         fontSize: 18),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               width: 230,
//               padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//               decoration: BoxDecoration(
//                 color: Color(0xEFCFCFAEE),
//                 borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(15.0),
//                   bottomRight: Radius.circular(15.0),
//                 ),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.end,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     // Align children to both ends
//                     children: [
//                       Text(
//                         "칼로리 합계",
//                         style: TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 15,
//                         ),
//                       ),
//                       Text(
//                         '$totalCal kcal',
//                         style: TextStyle(
//                           color: Color(0xC6222B45),
//                           fontSize: 12,
//                           fontWeight: FontWeight.w700,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     children: [
//                       Text(
//                         '계란',
//                         textAlign: TextAlign.left,
//                         style: TextStyle(
//                           color: Color(0xC6222B45),
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(width: 135),
//                       Text(
//                         '$eggCal kcal',
//                         textAlign: TextAlign.right,
//                         style: TextStyle(
//                           color: Color(0xc6222B45),
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 5),
//                   Row(
//                     children: [
//                       Text(
//                         '사과',
//                         style: TextStyle(
//                           color: Color(0xC6222B45),
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       SizedBox(width: 130),
//                       Text(
//                         '$appleCal kcal',
//                         style: TextStyle(
//                           color: Color(0xc6222B45),
//                           fontSize: 13,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 10),
//                   Row(
//                     children: [
//                       RectangleText(
//                         Palette.tanSu,
//                         realGram: 30.9,
//                       ),
//                       SizedBox(width: 10),
//                       RectangleText(
//                         Palette.danBaek,
//                         realGram: 14,
//                       ),
//                       SizedBox(width: 10),
//                       RectangleText(
//                         Palette.jiBang,
//                         realGram: 34,
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ));
//   }
//
// }
