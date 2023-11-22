import 'package:flutter/material.dart';
import 'package:koofit/model/config/palette.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text("내 정보"),
        titleTextStyle: TextStyle(color: Colors.black87, fontSize: 20, fontWeight: FontWeight.bold),
        leading:  IconButton(
        onPressed: () {
        Navigator.pop(context); //뒤로가기
        },
        color: Colors.black87,
        icon: Icon(Icons.arrow_back, size: 25),
        ),
      ),


    );
  }
}
