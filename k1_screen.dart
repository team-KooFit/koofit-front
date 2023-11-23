import 'package:exercisemain/core/app_export.dart';
import 'package:exercisemain/presentation/k0_screen/k0_screen.dart';
import 'package:exercisemain/widgets/custom_elevated_button.dart';
import 'package:flutter/material.dart';

class K1Screen extends StatefulWidget {
  const K1Screen({Key? key}) : super(key: key);

  @override
  _K1ScreenState createState() => _K1ScreenState();
}

class _K1ScreenState extends State<K1Screen> {
  TextEditingController _timeController = TextEditingController();
  TextEditingController _exerciseNameController = TextEditingController(); // 새로 추가된 컨트롤러
  String _intensity = "가볍게"; // 초기값 설정

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              _buildArrowOneSection(context),
              SizedBox(height: 34),
              _buildFiveSection(context),
              SizedBox(height: 35),
              _buildFourSection(context),
              SizedBox(height: 60),
              Text(
                "예상 소모 칼로리",
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 33),
              SizedBox(
                width: 98,
                child: Text(
                  "0 kcal",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 24),
                ),
              ),
              SizedBox(height: 5),
            ],
          ),
        ),
        bottomNavigationBar: _buildSection(context),
      ),
    );
  }

  Widget _buildArrowOneSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showExerciseNameInputDialog(context);
      },
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 40,
        ),
        decoration: BoxDecoration(
          color: Color(0xffA7ECEE),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomImageView(
              imagePath: ImageConstant.imgArrow1,
              height: 3,
              width: 34,
            ),
            SizedBox(height: 39),
            Align(
              alignment: Alignment.center,
              child: Text(
                _exerciseNameController.text.isNotEmpty
                    ? _exerciseNameController.text
                    : "운동이름",
                style: CustomTextStyles.headlineMediumBlack900,
              ),
            ),
            SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  Widget _buildFiveSection(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showTimeInputDialog(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(
          horizontal: 38,
          vertical: 22,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(30),
          color: Color(0xffEFEFEF)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: 3,
                bottom: 4,
              ),
              child: Text(
                "운동 시간",
                style: theme.textTheme.bodyLarge,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 6,
                bottom: 3,
              ),
              child: Text(
                _timeController.text.isNotEmpty
                    ? "${_timeController.text}분"
                    : "0분",
                style: CustomTextStyles.titleLargeGray500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFourSection(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 21,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(30),
          color: Color(0xffEFEFEF)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.only(
              top: 5,
              bottom: 5,
            ),
            child: Text(
              "운동 강도",
              style: theme.textTheme.bodyLarge,

            ),
          ),
          _buildIntensityButton("가볍게"),
          _buildIntensityButton("적당히"),
          _buildIntensityButton("격하게"),
        ],
      ),
    );
  }

  Widget _buildIntensityButton(String intensity) {
    return InkWell(
      onTap: () {
        _selectIntensity(intensity);
      },
      child: Container(
        width: 80,
        padding: EdgeInsets.symmetric(
          horizontal: 11,
          vertical: 6,
        ),
        decoration: BoxDecoration(
          color: _intensity == intensity ? Colors.black : Colors.white,
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: Text(
            intensity,
            style: TextStyle(
              color: _intensity == intensity ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSection(BuildContext context) {
    return CustomElevatedButton(
      text: "입력 완료",
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const K0Screen()),
        );
      },
    );
  }

  void _showTimeInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("운동 시간 입력"),
          content: TextField(
            controller: _timeController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "분을 입력하세요"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("취소"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text("확인"),
            ),
          ],
        );
      },
    );
  }

  void _selectIntensity(String selectedIntensity) {
    setState(() {
      _intensity = selectedIntensity;
    });
  }

  void _showExerciseNameInputDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("운동 이름 입력"),
          content: TextField(
            controller: _exerciseNameController,
            decoration: InputDecoration(labelText: "운동 이름을 입력하세요"),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("취소"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {});
              },
              child: Text("확인"),
            ),
          ],
        );
      },
    );
  }
}
