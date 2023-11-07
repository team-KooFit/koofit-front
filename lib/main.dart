import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;
    List<List<String>> li = [['전체', '김민태', '다이어트 하는중', '32', '42', '41', '30분 전'], ['식단','송해원', '유산소 했다', '31', '42', '62', '1시간 전'],['운동', '송혜원', '공복인데..', '31', '62','30', '1시간 전'], ['20대','송해원', '대학생활', '28', '10', '32', '하루 전'],['10대','송해원', '음료 맛있다', '70', '40', '60', '하루 전']];
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child : Column(
              children: <Widget>[

                Text('정보게시판', style: TextStyle(fontSize: 24),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                      Container(
                        width: screenWidth * 0.15,
                        height: screenHeight * 0.03,
                        decoration : BoxDecoration(
                          borderRadius : BorderRadius.circular(10.0),
                          border : Border.all(
                            color : Colors.black,
                            width : 1.0,
                          ),
                          color: Color(0xFFD9D9D9),
                        ),

                        margin : EdgeInsets.only(left : screenWidth * 0.05, top : screenHeight * 0.05),
                        alignment: Alignment.center,
                        child: Text('전체', style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        ),

                ),
                      Container(
                        width: screenWidth * 0.15,
                        height: screenHeight * 0.03,
                        child : TextButton(
                          style : TextButton.styleFrom(
                            padding : EdgeInsets.all(0),
                          shape : RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          ),
                          side : BorderSide(
                            color : Colors.black,
                            width : 1.0,
                          ),
                          backgroundColor: Color(0xFFD9D9D9),
                        ),
                        onPressed : () {

                        },
                          child : Text(
                            '전체',
                            style : TextStyle(
                              fontSize : 20,
                              color : Colors.black,
                        ),
                        ),
                      ),
                      ),

                      Container(
                        width: screenWidth * 0.15,
                        height: screenHeight * 0.03,
                        decoration : BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border : Border.all(
                            color : Colors.black,
                            width : 1.0,
                          ),
                          color: Color(0xFFD9D9D9),
                        ),
                        margin : EdgeInsets.only(left : screenWidth * 0.10, top : screenHeight * 0.05),
                        alignment: Alignment.center,
                        child: Text('운동', style : TextStyle(
                          fontSize : 20,
                          color : Colors.black,
                        ),
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.15,
                        height: screenHeight * 0.03,
                        decoration: BoxDecoration(
                          borderRadius : BorderRadius.circular(10.0),
                          border : Border.all(
                            color : Colors.black,
                            width : 1.0,
                          ),
                          color: Color(0xFFD9D9D9),
                        ),
                        margin : EdgeInsets.only(left : screenWidth * 0.10, top : screenHeight * 0.05),
                        alignment: Alignment.center,
                        child: Text('20대', style : TextStyle(
                          fontSize : 20,
                          color : Colors.black,
                        ),
                        ),
                      ),
                  ],
                ),
                for (int i = 0; i < li.length;i++)

                Container(
                  width : screenWidth * 0.95,
                  height : screenHeight * 0.15,
                  margin : EdgeInsets.only( top : screenHeight * 0.05),
                  decoration : BoxDecoration(
                    borderRadius : BorderRadius.circular(10.0),
                    border : Border.all(
                      color : Colors.black,
                      width : 1.0,
                    ),
                    color : Colors.white,
                  ),
                  child : Column(
                    children : [
                      Padding(
                        padding : EdgeInsets.only(top: screenHeight * 0.01),
                        child : Row(
                        children : [
                          Padding(
                          padding : EdgeInsets.only(left : screenWidth * 0.03),
                            child : Text(li[i][0], style : TextStyle(fontSize : 16,

                          ),
                          ),
                          ),

                          SizedBox(width : 30),
                          Text(li[i][1], style : TextStyle(fontSize : 16,
                          ),
                          ),
                        ]
                      ),
                      ),
                    Center(
                      child : Padding(
                      padding : EdgeInsets.only(top : screenHeight * 0.025),
                        child :Text(li[i][2],
                        style : TextStyle(
                        fontSize : 20,
                      ),
                    ),
                    ),
                    ),
                      Padding(
                        padding : EdgeInsets.only(top : screenHeight * 0.025),
                        child : Row(
                          children : [
                            Padding(
                              padding : EdgeInsets.only(left : 20.0),
                              child : Icon(Icons.adb_rounded),
                            ),
                            SizedBox(width : 20),
                            Text(li[i][3], style : TextStyle(
                              fontSize: 15,
                            ),
                            ),
                            SizedBox(width : 30),
                            Icon(Icons.account_box),
                            SizedBox(width : 20),
                            Text(li[i][4], style : TextStyle(
                              fontSize : 15,
                            ),
                            ),
                            SizedBox(width : 30),
                            Icon(Icons.adb_rounded),
                            SizedBox(width : 20),
                            Text(li[i][5], style : TextStyle(
                              fontSize : 15,
                            ),
                            ),
                            Padding(
                              padding : EdgeInsets.only(left : screenWidth * 0.12),
                              child : Text(li[i][6], style : TextStyle(
                                fontSize : 15,
                              ),
                              ),
                            ),
                          ]
                        ),
                      )
                    ]
                  ),
                ),

              ]
          ),
          ),
          bottomNavigationBar : BottomAppBar(
            child : Row(
              mainAxisAlignment : MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed : () {
                  },
                  child : Text('홈', style : TextStyle(
                    color : Color(0xFF767676),
                    fontSize: 20,
                  ),
                  ),
                ),
                TextButton(
                  onPressed : () {
                  },
                  child : Text('식단', style : TextStyle(
                    color : Color(0xFF767676),
                    fontSize : 20,
                  ),
                  ),
                ),
                TextButton(
                  onPressed : () {
                  },
                  child : Text('운동', style : TextStyle(
                      color : Color(0xFF767676),
                    fontSize : 20,
                  ),
                ),
                ),
                IconButton(
                  icon : Icon(Icons.person),
                  onPressed : () {
                },
                ),
              ]
            ),

          ),
        ),
    );
  }
}