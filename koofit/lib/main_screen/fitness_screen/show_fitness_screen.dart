import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koofit/main_screen/main_diet_screen/today_calories_card.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/widget/circleText.dart';
import 'package:koofit/fitness/core/app_export.dart';
import 'package:koofit/fitness/widgets/custom_elevated_button.dart';

class FitnessModalBottomSheet extends StatefulWidget {
  @override
  _FitnessModalBottomSheetState createState() =>
      _FitnessModalBottomSheetState();
}

class _FitnessModalBottomSheetState extends State<FitnessModalBottomSheet> {
  late List<bool> isSelected;
  String result = '';

  bool isWeak = true;
  bool isMiddle = false;
  bool isStrong = false;

  bool _isCheckCardio = false;
  bool _isCheckWeight = false;
  bool _isCheckStretch = false;
  List<String> fitnessCheckList = [];

  TextStyle selectedTextStyle = TextStyle(fontWeight: FontWeight.bold);
  TextStyle unselectedTextStyle = TextStyle();
  FocusNode timeField = FocusNode();
  String _finessTime = '';

  @override
  void initState() {
    isSelected = [isStrong, isMiddle, isWeak];
    super.initState();
  }

  void toggleSelect(value) {
    if (value == 0) {
      isStrong = true;
      isMiddle = false;
      isWeak = false;
    } else if (value == 1) {
      isStrong = false;
      isMiddle = true;
      isWeak = false;
    } else {
      isStrong = false;
      isMiddle = false;
      isWeak = true;
    }
    setState(() {
      isSelected = [isStrong, isMiddle, isWeak];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 35),
      child: Column(
        children: <Widget>[
          Text(
            "오늘의 운동을 기록해볼까요?",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 35),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: [
                nameSection(),
                SizedBox(height: 34.v),
                timeSection(),
                SizedBox(height: 35.v),
                StrongSection(),
                SizedBox(height: 60.v),
              ],
            ),
          ),
          const Spacer(),
          buildSection(),
        ],
      ),
    ); // Your existing build method content
  }

  Widget nameSection() {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 10.v,
        ),
        decoration: AppDecoration.outlineBlack.copyWith(
          color: Colors.white,
          borderRadius: BorderRadiusStyle.roundedBorder30,
        ),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("운동 종류",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                        child: Row(children: [
                      Checkbox(
                        value: _isCheckCardio,
                        onChanged: (value) {
                          setState(() {
                            _isCheckCardio = value!;
                          });
                        },
                        checkColor: Colors.white, // Set the color when the checkbox is checked
                        activeColor: Palette.mid_dark_mainSkyBlue,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.grey), // Set the border thickness and color
                          borderRadius: BorderRadius.circular(5), // Adjust border radius if needed
                        ),// Set the color of the checkbox itself
                      ),
                      Text("유산소"),
                      Checkbox(
                        value: _isCheckWeight,
                        onChanged: (value) {
                          setState(() {
                            _isCheckWeight = value!;
                          });
                        },
                        checkColor: Colors.white, // Set the color when the checkbox is checked
                        activeColor: Palette.mid_dark_mainSkyBlue,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.grey), // Set the border thickness and color
                          borderRadius: BorderRadius.circular(5), // Adjust border radius if needed
                        ),
                      ),
                      Text("무산소"),
                    ])),
                    SizedBox(height: 8),
                    Container(
                      height: 20,
                        child: Row(children: [
                      Checkbox(
                        value: _isCheckStretch,
                        onChanged: (value) {
                          setState(() {
                            _isCheckStretch = value!;
                          });
                        },
                        checkColor: Colors.white, // Set the color when the checkbox is checked
                        activeColor: Palette.mid_dark_mainSkyBlue,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Colors.grey), // Set the border thickness and color
                          borderRadius: BorderRadius.circular(5), // Adjust border radius if needed
                        ),
                      ),
                      Text("스트레칭"),
                    ]))
                  ])
            ]));
  }

  /// Section Widget
  Widget timeSection() {
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.h,
          vertical: 22.v,
        ),
        decoration: AppDecoration.outlineBlack.copyWith(
          color: Colors.white,
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
                child: Text("운동 시간",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
              ),
              Spacer(),
              Container(
                  width: 40,
                  height: 20,
                  // padding: EdgeInsets.only(
                  //   top: 3.v,
                  //   bottom: 4.v,
                  // ),
                  child: TextFormField(
                      onSaved: (val) {
                        setState(() {
                          _finessTime = val.toString();
                        });
                      },
                      validator: (val) {
                        if (val != null) {
                        } else {
                          return '운동시간';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      onChanged: (text) {
                        setState(() {});
                      },
                      maxLength: 3,
                      // focusNode: timeField,
                      decoration: const InputDecoration(
                          counterText: '',
                          labelStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12),
                          focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Palette.mainSkyBlue))))),
              Padding(
                padding: EdgeInsets.only(
                    top: 3.v, bottom: 4.v, right: 10.v, left: 10.v),
                child: Text(
                  "분",
                  style: TextStyle(color: Colors.black87, fontSize: 17),
                ),
              ),
            ]));
  }

  /// Section Widget
  Widget StrongSection() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.h,
        vertical: 15.v,
      ),
      decoration: AppDecoration.outlineBlack.copyWith(
        borderRadius: BorderRadiusStyle.roundedBorder30,
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("운동 강도",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17)),
          ToggleButtons(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Text('가볍게',
                    style: isSelected[0]
                        ? selectedTextStyle
                        : unselectedTextStyle),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Text('적당히',
                    style: isSelected[1]
                        ? selectedTextStyle
                        : unselectedTextStyle),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 13),
                child: Text('격하게',
                    style: isSelected[2]
                        ? selectedTextStyle
                        : unselectedTextStyle),
              )
            ],
            isSelected: isSelected,
            onPressed: toggleSelect,
            borderRadius: BorderRadius.circular(20.0),
            constraints: const BoxConstraints(
              minHeight: 30.0,
              minWidth: 25.0,
            ),
            selectedColor: Colors.black54,
            fillColor: Palette.mid_dark_mainSkyBlue,
            color: Colors.black54,
          )
        ],
      ),
    );
  }

  /// Section Widget
  Widget buildSection() {
    return SizedBox(
        width: double.infinity,
        height: 50.h,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                backgroundColor: Palette.mainSkyBlue,
                disabledBackgroundColor: Palette.mainSkyBlue.withOpacity(0.12)),
            onPressed: () {},
            child: Text('추가',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.white))));
  }
}

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
        child: FitnessModalBottomSheet(),
      );
    },
  );
}
