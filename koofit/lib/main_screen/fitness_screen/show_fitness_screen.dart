
import 'package:flutter/material.dart';
import 'package:koofit/main_screen/main_diet_screen/today_calories_card.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/widget/circleText.dart';
import 'package:koofit/core/app_export.dart';
import 'package:koofit/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';


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
          child:
          Container(
            padding: const EdgeInsets.only(
                top: 20, left: 20, right: 20, bottom: 35),
            child: Column(
              children: <Widget>[
                Text("오늘의 운동을 기록해볼까요?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                SizedBox(height: 35),
                Card(
                  color: Color(0xFFEFEFEF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        30), // 모서리를 둥글게 만드는 값 설정
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Column(
                      children: [
                        SizedBox(height: 34.v),
                        buildFiveSection(),
                        SizedBox(height: 35.v),
                        buildFourSection(),
                        SizedBox(height: 60.v),
                        Text(
                          "예상 소모 칼로리",
                          style: theme.textTheme.headlineMedium,
                        ),
                        SizedBox(height: 33.v),
                        SizedBox(
                          width: 98.h,
                          child: Text(
                            "0 kcal",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.titleLarge,
                          ),
                        ),
                        SizedBox(height: 5.v),
                      ],
                    ),
                  ),
                ),
                const Spacer(),
                buildSection(),


              ],
            ),)
      );
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


  /// Section Widget
  Widget buildFiveSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 38.h,
        vertical: 22.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 3.v,
              bottom: 4.v,
            ),
            child: Text(
              "운동 시간",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 6.h,
              bottom: 3.v,
            ),
            child: Text(
              "0분",
              style: CustomTextStyles.titleLargeGray500,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildFourSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      padding: EdgeInsets.symmetric(
        horizontal: 13.h,
        vertical: 21.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 25.h,
              top: 5.v,
              bottom: 5.v,
            ),
            child: Text(
              "운동 강도",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Container(
            width: 61.h,
            margin: EdgeInsets.only(left: 30.h),
            padding: EdgeInsets.symmetric(
              horizontal: 11.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.fillSecondaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "가볍게",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Container(
            width: 61.h,
            margin: EdgeInsets.only(left: 11.h),
            padding: EdgeInsets.symmetric(
              horizontal: 11.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.fillSecondaryContainer.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "적당히",
              style: theme.textTheme.bodyMedium,
            ),
          ),
          Container(
            width: 61.h,
            margin: EdgeInsets.only(left: 11.h),
            padding: EdgeInsets.symmetric(
              horizontal: 11.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.fillBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "격하게",
              style: CustomTextStyles.bodyMediumOnPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildSection() {
    return CustomElevatedButton(
      text: "입력 완료",
      margin: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        bottom: 20.v,
      ),
    );
  }
