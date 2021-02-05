import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final signinFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool logginIn;
  bool registering;
  bool loginError;
  bool registerError;
  bool registerSuccesful;
  String loginErrorMessage;
  String registerErrorMessage;
  User user;

  Auth() {
    onAuthStateChanged.listen((User usr) {
      this.user = usr;
      notifyListeners();
    });
  }

  @override
  Stream<User> get onAuthStateChanged => _firebaseAuth.authStateChanges();

  String get welcomeMessage => user == null ? 'asd' : 'Welcome, ${user.email}';

  @override
  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    this.registering = true;
    try {
      var user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      this.user = user;
      this.registerError = false;
      this.registerSuccesful = true;
    } catch (e) {
      this.registerError = true;
      this.registerErrorMessage = "An error occured while trying to sign up";
    }
    this.registering = false;
    notifyListeners();
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    this.logginIn = true;
    try {
      var user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      this.user = user;
      this.loginError = false;
    } catch (e) {
      this.loginError = true;
      this.loginErrorMessage = "An error occured while trying to sign in";
    }
    this.logginIn = false;
    notifyListeners();
  }

  @override
  Future<void> signOut() {
    _firebaseAuth.signOut();
  }
}
