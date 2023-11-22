import 'package:koofit/fitness/core/app_export.dart';
import 'package:koofit/fitness/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class K1Screen extends StatelessWidget {
  const K1Screen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);

    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildArrowOneSection(context),
              SizedBox(height: 34.v),
              _buildFiveSection(context),
              SizedBox(height: 35.v),
              _buildFourSection(context),
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
        bottomNavigationBar: _buildSection(context),
      ),
    );
  }

  /// Section Widget
  Widget _buildArrowOneSection(BuildContext context) {
    return Container(
      width: double.maxFinite,
      padding: EdgeInsets.symmetric(
        horizontal: 16.h,
        vertical: 40.v,
      ),
      decoration: AppDecoration.fillPrimary,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomImageView(
            imagePath: ImageConstant.imgArrow1,
            height: 3.v,
            width: 34.h,
          ),
          SizedBox(height: 39.v),
          Align(
            alignment: Alignment.center,
            child: Text(
              "운동이름",
              style: CustomTextStyles.headlineMediumBlack900,
            ),
          ),
          SizedBox(height: 25.v),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildFiveSection(BuildContext context) {
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
  Widget _buildFourSection(BuildContext context) {
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
  Widget _buildSection(BuildContext context) {
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
