import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import './src/screens/Login.dart';
import './src/screens/Home.dart';

void main() {
  // runApp(Center(child: Text("Hello world", textDirection: TextDirection.ltr)));
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Login()), routes: {
      '/login': (BuildContext context) {
        return Login();
      },
    });
  }
}
