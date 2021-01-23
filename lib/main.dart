import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import './src/screens/Login.dart';
import './src/screens/Home.dart';
import './src/screens/LoadingScreen.dart';

void main() {
  // runApp(Center(child: Text("Hello world", textDirection: TextDirection.ltr)));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Return error screen and tell the user to reload app
        if (snapshot.hasError) {
          return Text(" Error ");
        }
        // Proceed normally
        if (snapshot.connectionState == ConnectionState.done) {
          return MyApp();
        }

        return LoadingScreen();
      }));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User> snapshot) {
          var initialRoute = snapshot.hasData ? '/' : '/login';
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }

          // Actual app
          return MaterialApp(
              theme: ThemeData(primaryColor: Colors.deepPurple[800]),
              initialRoute: initialRoute,
              routes: {
                '/login': (BuildContext context) {
                  return Scaffold(body: Login());
                },
                '/': (BuildContext context) {
                  return Home();
                }
              });
        });
  }
}
