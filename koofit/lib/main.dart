import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:koofit/login/main_login_screen.dart';
import 'package:koofit/login/sign_up_screen';
import 'package:koofit/login/body_size_sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  // This widget is the root of your application.
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 844),
        minTextAdapt: true,
        builder: (context, child) {
          return GetMaterialApp(
              // navigatorObservers: <NavigatorObserver>[observer],
              initialRoute: 'BodySignUp',
              routes: {
                // SplashScreen.routeName: (context) => SplashScreen(),
                'home': (context) => const LoginScreen(),
                'signUp': (context) => const SignUpScreen(),
                'BodySignUp': (context) => const BodyInfoScreen()
              });
        });
  }
}
