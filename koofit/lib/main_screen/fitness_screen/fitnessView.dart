import 'package:flutter/material.dart';
import 'package:koofit/fitness/core/app_export.dart';
import 'package:koofit/fitness/widgets/custom_elevated_button.dart';

class FitnessView extends StatefulWidget {
  const FitnessView({super.key});

  @override
  State<FitnessView> createState() => _FitnessViewState();
}

class _FitnessViewState extends State<FitnessView> {

  String result = '';
  bool isStrong = true;
  bool isMiddle = false;
  bool isWeak = false;
  late List<bool> isSelected;

  @override
  void initState() {
    isSelected = [isStrong, isMiddle, isWeak];
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
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
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: [
                  SizedBox(height: 34.v),
                  buildFiveSection(),
                  SizedBox(height: 35.v),
                  buildFourSection(),
                  SizedBox(height: 60.v),

                ],
              ),
            ),
          ),
          const Spacer(),
          buildSection(),
        ],
      ),);
  }


  /// Section Widget
  Widget buildFiveSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
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
          ToggleButtons(
              children: [
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Text('가볍게'),
              ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 13),
                  child: Text('적당히'),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 13),
                    child: Text('격하게'))
              ],
            isSelected: isSelected,
            onPressed: toggleSelect)
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


  void toggleSelect(value) {
    if (value == 0) {
      isStrong = true;
      isMiddle = false;
      isWeak=false;
    } else if (value ==1) {
      isStrong = false;
      isMiddle = true;
      isWeak = false;
    } else{
      isStrong = false;
      isMiddle = false;
      isWeak = true;
    }
    setState(() {
      isSelected = [isStrong, isMiddle, isWeak];
    });
  }
}
