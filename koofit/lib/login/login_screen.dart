import 'package:flutter/material.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/model/data/Nutrient.dart';
import 'package:koofit/model/data/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late BuildContext scaffoldContext;

  bool isLoading = false;
  bool isKakaoClicked = false;

  @override
  Widget build(BuildContext context) {
    scaffoldContext = context;

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Palette.mainSkyBlue,
            body: Container(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                child: Form(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 100),
                        const Text(
                          'KooFit',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 60,
                            // fontFamily: 'Pacifico',
                            fontWeight: FontWeight.w600,
                            height: 0.01,
                          ),
                        ),
                        const Spacer(),
                        _kakaoLoginButton(),
                        const SizedBox(
                          height: 20,
                        ),
                        // if (!Platform.isAndroid) _appleLoginButton(),
                      ]),
                ))));
  }

// UI: 카카오 로그인 버튼
  Widget _kakaoLoginButton() {
    return GestureDetector(
      onTap: () {
        // if(!isLoading){
        //   signInWithKakao();
        // }
      },
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
            color: const Color(0XFFFEE500),
            borderRadius: BorderRadius.circular(12)),
        child: isLoading == true && isKakaoClicked == true
            ? SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.black.withOpacity(0.85),
                  strokeWidth: 3,
                ),
              )
            : GestureDetector(
                onTap: () {
                  User newUser = User(
                      uid: "",
                      name: "",
                      gender: "",
                      stuNumber: "",
                      number: "",
                      age: "",
                      height: 0,
                      curWeight: 0,
                      goalWeight: 0,
                      todayNutrientList: [],
                      goalNutrient: Nutrient(calories: 0, carbo: 0, protein: 0, fat: 0, fitnessTime: 0),
                      fitnessList: [],
                      serviceNeedsAgreement: false,
                      privacyNeedsAgreement: false);

                  Navigator.pushNamed(scaffoldContext, 'signUp',
                      arguments: newUser);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/kakao_symbol.png',
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '카카오 로그인 ',
                      style: TextStyle(
                          fontSize: 15, color: Colors.black.withOpacity(0.85)),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
