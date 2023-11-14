import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koofit/login/login_screen.dart';
import 'package:koofit/main_screen/main_diet_screen/diet_screen.dart';
import 'package:koofit/model/data/user.dart';
import 'package:koofit/widget/loading_view.dart';
import 'package:get/get.dart';
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // final _authentication = firebase.FirebaseAuth.instance;
  String newUserUid = '';
  bool isLoading = true;
  bool isSuccess = false;

  @override
  void initState() {
    super.initState();
    isLoading = false;
    isSuccess = true;
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   _uploadUserToFirebase().then((value) {
    //     setState(() {
    //       isLoading = false;
    //     });

    final args = ModalRoute.of(context)!.settings.arguments as User;

    Future.delayed(Duration(seconds: 2)).then((value) {
      if (isSuccess) {
        Get.offAll(DietScreen(), arguments: newUserUid);
      } else {
        Get.offAll(LoginScreen(), arguments: newUserUid);
      }
    });

    // });
  }

  @override
  Widget build(BuildContext context) {

    return isLoading
        ? loadingView()
        : WillPopScope(
            onWillPop: () async {
              return false;
            },
            child: Scaffold(
                backgroundColor: const Color(0xFFffffff),
                body: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: Form(
                        child: Center(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: Text(
                              isSuccess ? "회원가입 완료!" : "회원가입 실패...",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color.fromRGBO(51, 61, 75, 0.6)),
                            ),
                          ),
                          Text(
                            isSuccess ? " {args.name}님," : "다시 한번",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                                color: const Color.fromARGB(255, 51, 61, 75)),
                          ),
                          Text(
                            isSuccess ? "환영합니다!" : "시도해주세요",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                                color: const Color.fromARGB(255, 51, 61, 75)),
                          ),
                        ]))))));
  }
}
