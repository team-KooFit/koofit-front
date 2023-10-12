//Palette.mainSkyBlue
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:koofit/model/config/palette.dart';

class BodyInfoScreen extends StatefulWidget {
  const BodyInfoScreen({super.key});

  @override
  State<BodyInfoScreen> createState() => _BodyInfoScreenState();
}

class _BodyInfoScreenState extends State<BodyInfoScreen> {
  final formKey = GlobalKey<FormState>();

  final List<String> _textList = [
    '키를 입력해주세요.',
    '몸무게를 입력해주세요.',
    '목표 몸무게를 입력해주세요.'
  ];

  FocusNode heightField = FocusNode();
  FocusNode weightField = FocusNode();
  FocusNode goalWeightField = FocusNode();

  bool isHeightFilled = false;
  bool isWeightFilled = false;
  bool isGoalWeightFilled = false;

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
                                color: Colors.black54),
                          ),
                          Visibility(
                            visible: isGoalWeightFilled,
                            child: TextFormField(
                              onSaved: (val) {
                                setState(() {
                                  _goalWeight = val.toString();
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
                              // focusNode: heightField,
                              onChanged: (text) {
                                setState(() {
                                  _goalWeight = text;
                                  if (titleIndex == 2) {
                                    if (_height.isNotEmpty &&
                                        _height.length > 2 &&
                                        _goalWeight.length > 1 &&
                                        _weight.length > 1) {
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
                            visible: isWeightFilled,
                            child: TextFormField(
                              onSaved: (val) {
                                setState(() {
                                  _weight = val.toString();
                                });
                              },
                              validator: (val) {
                                if (val != null) {
                                  if (val.length < 2) {
                                    return '올바른 몸무게를 입력해주세요';
                                  }
                                } else {
                                  return '몸무게를 입력해주세요';
                                }
                                return null;
                              },
                              autofocus: true,
                              focusNode: weightField,
                              maxLength: 3,
                              keyboardType: TextInputType.number,
                              inputFormatters: <TextInputFormatter>[
                                FilteringTextInputFormatter.digitsOnly
                              ],
                              onChanged: (text) {
                                setState(() {
                                  _weight = text;
                                  if (titleIndex == 1) {
                                    if (text.length > 1) {
                                      isButtonActive = true;
                                    }
                                  } else if (titleIndex == 2) {
                                    if (_height.isNotEmpty &&
                                        _weight.length > 1 &&
                                        _goalWeight.length > 1) {
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
                            onSaved: (val) {
                              setState(() {
                                _height = val.toString();
                              });
                            },
                            validator: (val) {
                              if (val != null) {
                                _height = val;
                              } else {
                                return '키를 입력해주세요';
                              }
                              return null;
                            },
                            focusNode: heightField,
                            autofocus: true,
                            onChanged: (value) {
                              setState(() {
                                _height = value;
                                if (titleIndex == 0) {
                                  isButtonActive = value.isNotEmpty;
                                } else if (titleIndex == 2) {
                                  if (_height.isNotEmpty &&
                                      _goalWeight.length > 1 &&
                                      _weight.length > 1) {
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
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            maxLength: 3,
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
                                        disabledForegroundColor: titleIndex == 2
                                            ? Colors.white
                                            : null,
                                        disabledBackgroundColor: titleIndex == 2
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
                                          isGoalWeightFilled = true;
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
                                            //   height: _height,
                                            //   profileImage: args.profileImage,

                                            // );
                                            // Navigator.pushheightd(context, 'school',
                                            //     arguments: newUser);
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
