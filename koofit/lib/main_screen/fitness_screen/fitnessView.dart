import 'package:flutter/material.dart';
import 'package:koofit/main_screen/main_diet_screen/today_calories_card.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/widget/circleText.dart';
import 'package:koofit/core/app_export.dart';
import 'package:koofit/widgets/custom_elevated_button.dart';

class FitnessView extends StatefulWidget {
  const FitnessView({super.key});

  @override
  State<FitnessView> createState() => _FitnessViewState();
}

class _FitnessViewState extends State<FitnessView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 35),
      child: Column(
        children: <Widget>[
          Text(
            "오늘의 운동을 기록해볼까요?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 35),
          Card(
            color: Color(0xFFEFEFEF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // 모서리를 둥글게 만드는 값 설정
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(height: 34.v),
                  buildFiveSection(),
                  SizedBox(height: 40.v),
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
      ),
    );
  }

  /// Section Widget
  Widget buildFiveSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.h),
      // padding: EdgeInsets.symmetric(
      //   horizontal: 38.h,
      //   vertical: 22.v,
      // ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // padding: EdgeInsets.only(
          //   right: 6.h,
          //   top: 3.v,
          //   bottom: 4.v,
          // ),
          Text(
            "운동 시간",
            style: theme.textTheme.bodyLarge,
          ),

          Row(
            children: [
              // const TextField(
              //   keyboardType: TextInputType.number,
              //   decoration: InputDecoration(
              //     hintText: '00',
              //   ),
              // ),
              Text(
                "분",
                style: CustomTextStyles.titleLargeGray500,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildFourSection() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 0.h),
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
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
              left: 5.h,
              top: 5.v,
              bottom: 5.v,
            ),
            child: Text(
              "운동 강도",
              style: theme.textTheme.bodyLarge,
            ),
          ),
          Container(
            width: 60.h,
            margin: EdgeInsets.only(left: 10.h),
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
            width: 60.h,
            margin: EdgeInsets.only(left: 10.h),
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
            width: 60.h,
            margin: EdgeInsets.only(left: 10.h),
            padding: EdgeInsets.symmetric(
              horizontal: 11.h,
              vertical: 6.v,
            ),
            decoration: AppDecoration.fillBlack.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder5,
            ),
            child: Text(
              "격하게",
              style: CustomTextStyles.bodySmallOnPrimaryContainer,
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
}
