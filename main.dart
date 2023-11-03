import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter_application_1/user.dart';


void main() async {
 final provider
  // WidgetsFlutterBinding.ensureInitialized();


  await biohealthcareAPIConfig.init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'First app',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyhomePage(),
    );
  }
}


class MyhomePage extends StatelessWidget {
  const MyhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First app'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[Text('Hello'), Text('Hello'), Text('Hello')],
        ),
      ),
    );
  }
}
