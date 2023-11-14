// 2023.06.18 SUN Midas: ✅
// 코드 효율성 점검: ✅
// 예외처리: ✅
// 중복 서버 송수신 방지: ✅

import 'dart:convert';
import 'package:koofit/login/login_screen.dart';
import 'package:koofit/model/config/palette.dart';
import 'package:koofit/main_screen/main_diet_screen/diet_screen.dart';
import 'package:crypto/crypto.dart';
import 'package:hive/hive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
// import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = 'splash';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _routePage();

  }

  Future<void> _routePage() async {
    String initialRoute = 'no';
    String newUserUid = '';
    String uid = '';

    // null 예외 처리 ✅
    // // final userPlatform = await FlutterSecureStorage().read(key: 'userPlatform');
    // if (userPlatform != null) {
    //   // 만약, 로그인 정보가 있다면
    //
    //
    //   } else {
    //     // 만약, 카카오 로그인이라면
    //
    // }

    // 로그인 정보 파악 후, 페이지 이동
    await Future.delayed(Duration(seconds: 3));
    if (initialRoute == 'main') {
      // print('$userPlatform 토큰 자동 로그인 성공 👋');
      Get.offAll(() => DietScreen());
    } else {
      if (!mounted) return;
      Get.offAll(() => LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
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
                width: double.infinity,
                height: double.infinity,
                alignment: Alignment.topCenter,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        alignment: Alignment.topCenter,
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/splash_image.png'))))));
  }
}