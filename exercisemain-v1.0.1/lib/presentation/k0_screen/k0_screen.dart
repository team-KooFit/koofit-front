import 'package:koofit/core/app_export.dart';
import 'package:koofit/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class K0Screen extends StatelessWidget {
  const K0Screen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: EdgeInsets.symmetric(
            horizontal: 15.h,
            vertical: 40.v,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomImageView(
                imagePath: ImageConstant.imgArrow1,
                height: 3.v,
                width: 34.h,
              ),
              SizedBox(height: 56.v),
              Padding(
                padding: EdgeInsets.only(left: 4.h),
                child: Text(
                  "오늘의 운동시간",
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 38.v),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 94.h,
                  margin: EdgeInsets.only(right: 4.h),
                  child: Text(
                    "0 min",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 45.v),
              Padding(
                padding: EdgeInsets.only(left: 3.h),
                child: Text(
                  "소모 칼로리",
                  style: theme.textTheme.headlineMedium,
                ),
              ),
              SizedBox(height: 19.v),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: 98.h,
                  child: Text(
                    "0 kcal",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.titleLarge,
                  ),
                ),
              ),
              SizedBox(height: 5.v),
            ],
          ),
        ),
        bottomNavigationBar: _buildExerciseRecordButton(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildExerciseRecordButton(BuildContext context) {
    return CustomElevatedButton(
      text: "운동 기록하기",
      margin: EdgeInsets.only(
        left: 20.h,
        right: 20.h,
        bottom: 20.v,
      ),
    );
  }
}
