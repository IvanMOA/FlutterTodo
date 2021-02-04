import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/src/models/auth.dart';
import 'package:todolist/src/models/todo.dart';
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
          return MultiProvider(providers: [
            ChangeNotifierProvider<TodoListModel>(
                create: (context) => TodoListModel()),
            ChangeNotifierProvider<Auth>(create: (context) => Auth()),
          ], child: MyApp());
        }

        return LoadingScreen();
      }));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
    return StreamBuilder(
        stream: auth.onAuthStateChanged,
        builder: (context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingScreen();
          }
          // Actual app
          return MaterialApp(
            theme: ThemeData(
                primaryColor: Colors.deepPurple[800],
                textTheme: GoogleFonts.sourceCodeProTextTheme()),
            initialRoute: snapshot.hasData ? '/' : '/login',
            onGenerateRoute: (settings) {
              if (snapshot.hasData) {
                return MaterialPageRoute(
                    builder: (context) => Scaffold(
                        backgroundColor: Theme.of(context).primaryColor,
                        body: Home()));
              }
              if (!snapshot.hasData) {
                return MaterialPageRoute(builder: (context) => Login());
              }
              return MaterialPageRoute(
                  builder: (context) =>
                      Scaffold(body: Text('Route not found')));
            },
          );
        });
  }
}
