import 'package:flutter/material.dart';
import 'package:koofit/main_screen/fitness_screen/fitnessView.dart';
import 'package:koofit/main_screen/main_diet_screen/today_calories_card.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/widget/circleText.dart';
import 'package:koofit/core/app_export.dart';
import 'package:koofit/widgets/custom_elevated_button.dart';
import 'package:koofit/main_screen/fitness_screen/fitnessView.dart';

Future<void> ShowFitness(BuildContext context) async {
  mediaQueryData = MediaQuery.of(context);

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
      maxHeight: 697,
    ),
    builder: (BuildContext context) {
      return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          child: FitnessView());
    },
  );
}
//
// /// Section Widget
// Widget buildArrowOneSection() {
//   return Container(
//     width: double.maxFinite,
//     padding: EdgeInsets.symmetric(
//       horizontal: 16.h,
//       vertical: 40.v,
//     ),
//     decoration: AppDecoration.fillPrimary,
//     child: Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         CustomImageView(
//           imagePath: ImageConstant.imgArrow1,
//           height: 3.v,
//           width: 34.h,
//         ),
//         SizedBox(height: 39.v),
//         Align(
//           alignment: Alignment.center,
//           child: Text(
//             "운동이름",
//             style: CustomTextStyles.headlineMediumBlack900,
//           ),
//         ),
//         SizedBox(height: 25.v),
//       ],
//     ),
//   );
// }

