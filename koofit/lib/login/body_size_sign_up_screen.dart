//Palette.mainSkyBlue
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koofit/model/config/palette.dart';

class BodySignUpScreen extends StatefulWidget {
  const BodySignUpScreen({super.key});

  @override
  State<BodySignUpScreen> createState() => _BodySignUpScreenState();
}

class _BodySignUpScreenState extends State<BodySignUpScreen> {
  final formKey = GlobalKey<FormState>();

  final List<String> _textList = [
    '키를 입력해주세요.',
    '몸무게를 입력해주세요.',
    '목표 몸무게를 입력해주세요.'
  ];

  FocusNode node1 = FocusNode();
  FocusNode weightField = FocusNode();
  FocusNode goalWeightField = FocusNode();

  bool isHeightFilled = false;
  bool isWeightFilled = false;
  // bool isAgeFilled = false;

  bool isButtonActive = false;
  int titleIndex = 0;

  String _height = '';
  String _weight = '';
  String _goalWeight = '';

  @override
  Widget build(BuildContext context) {
    // final args = ModalRoute.of(context)!.settings.arguments as User;

    return WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: GestureDetector(
            onTap: hideKeyboard,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                backgroundColor: const Color(0xFFffffff),
                body: Container(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 20).r,
                  child: Form(
                    key: formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _textList[titleIndex],
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 22.sp,
                                color: const Color.fromARGB(255, 51, 61, 75)),
                          ),
                          Visibility(
                            visible: isWeightFilled,
                            child: TextFormField(
                              onSaved: (val) {
                                setState(() {
                                  _weight = val.toString();
                                });
                              },
                              validator: (val) {
                                if (val != null) {
                                } else {
                                  return '목표 몸무게를 입력해주세요';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              // focusNode: node1,
                              onChanged: (text) {
                                setState(() {
                                  _weight = text;
                                  if (titleIndex >= 2) {
                                    if (_height.isNotEmpty &&
                                            _goalWeight.length > 1 &&
                                            _weight.length > 1
                                        // int.parse(_weight) >= 15 &&
                                        // int.parse(_weight) <= 19
                                        ) {
                                      isButtonActive = true;
                                    } else {
                                      isButtonActive = false;
                                    }
                                  }
                                });
                              },
                              maxLength: 2,
                              focusNode: goalWeightField,
                              autofocus: true,
                              decoration: const InputDecoration(
                                  // errorText: _weight.isNotEmpty && _weight.length >2
                                  //     ? int.parse(_weight) >= 20
                                  //         ? '만 19세 이상은 서비스 이용이 제한됩니다.'
                                  //         : int.parse(_weight) < 15
                                  //             ? '15세 미만은 서비스 이용이 제한됩니다.'
                                  //             : null
                                  //     : null,
                                  counterText: '',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.mainSkyBlue)),
                                  labelText: "목표 몸무게",
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 182, 183, 184))),
                            ),
                          ),
                          Visibility(
                            visible: isHeightFilled,
                            child: TextFormField(
                              onSaved: (val) {
                                setState(() {
                                  _goalWeight = val.toString();
                                });
                              },
                              validator: (val) {
                                if (val != null) {
                                  if (val.length > 3) {
                                    return '올바른 몸무게를 입력해주세요';
                                  }
                                } else {
                                  return '몸무게를 입력해주세요';
                                }
                                return null;
                              },
                              autofocus: true,
                              focusNode: weightField,
                              maxLength: 11,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (text) {
                                setState(() {
                                  _goalWeight = text;
                                  if (titleIndex == 1) {
                                    if (text.length > 1) {
                                      isButtonActive = true;
                                    }
                                  } else if (titleIndex > 2) {
                                    if (_height.isNotEmpty &&
                                        _goalWeight.length > 2 &&
                                        _weight.length > 2) {
                                      isButtonActive = true;
                                    } else {
                                      isButtonActive = false;
                                    }
                                  }
                                });
                              },
                              decoration: const InputDecoration(
                                  counterText: '',
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Palette.mainSkyBlue)),
                                  labelText: "몸무게",
                                  labelStyle: TextStyle(
                                      color:
                                          Color.fromARGB(255, 182, 183, 184))),
                            ),
                          ),
                          TextFormField(
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            onSaved: (val) {
                              setState(() {
                                _height = val.toString();
                              });
                            },
                            validator: (val) {
                              if (val != null) {
                                return null;
                              } else {
                                return '키를 입력해주세요';
                              }
                            },
                            focusNode: node1,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                _height = value;
                                if (titleIndex == 0) {
                                  isButtonActive = value.isNotEmpty;
                                } else if (titleIndex > 2) {
                                  if (_height.isNotEmpty &&
                                      _goalWeight.length > 2 &&
                                      _weight.length > 2) {
                                    isButtonActive = true;
                                  } else {
                                    isButtonActive = false;
                                  }
                                }
                              });
                            },
                            decoration: const InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Palette.mainSkyBlue)),
                                labelText: "키",
                                labelStyle: TextStyle(
                                    color: Color.fromARGB(255, 182, 183, 184))),
                          ),
                          const Spacer(),
                          Visibility(
                              visible: isButtonActive,
                              child: SizedBox(
                                  width: double.infinity,
                                  height: 50.h,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Palette.mainSkyBlue,
                                        disabledForegroundColor: titleIndex > 2
                                            ? Colors.white
                                            : null,
                                        disabledBackgroundColor: titleIndex > 2
                                            ? Palette.mainSkyBlue
                                                .withOpacity(0.12)
                                            : null),
                                    onPressed: () {
                                      if (titleIndex == 0) {
                                        setState(() {
                                          weightField.requestFocus();
                                          isButtonActive = false;
                                          isHeightFilled = true;
                                          titleIndex = 1;
                                        });
                                      } else if (titleIndex == 1) {
                                        setState(() {
                                          goalWeightField.requestFocus();
                                          isButtonActive = false;
                                          isWeightFilled = true;
                                          titleIndex = 2;
                                        });
                                      } else {
                                        if (formKey.currentState != null) {
                                          // 만약, currentState 있다면
                                          if (formKey.currentState!
                                              .validate()) {
                                            formKey.currentState!.save();
                                            // User newUser = User(
                                            //   uid: args.uid,
                                            //   name: _height,
                                            //   profileImage: args.profileImage,

                                            // );
                                            // Navigator.pushNamed(
                                            //   context,
                                            //   'BodySignUp',
                                            // );
                                          }
                                        }
                                      }
                                    },
                                    child: Text('확인',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.sp)),
                                  ))),
                        ]),
                  ),
                ))));
  }

  void hideKeyboard() {
    FocusScope.of(context).unfocus();
  }
}