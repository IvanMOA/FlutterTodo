import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Auth extends ChangeNotifier {
  FirebaseAuth _firebaseAuth;
  final signinFormKey = GlobalKey<FormState>();
  final signupFormKey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController displayName = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  bool logginIn;
  bool registering;
  bool loginError;
  bool registerError;
  bool registerSuccesful;
  String loginErrorMessage;
  String registerErrorMessage;
  User user;

  Auth.instance({@required FirebaseAuth auth}) {
    this._firebaseAuth = auth;
    onAuthStateChanged.listen((User usr) {
      this.user = usr;
    });
  }

  Stream<User> get onAuthStateChanged => _firebaseAuth.authStateChanges();

  String get welcomeMessage => user == null ? 'asd' : 'Welcome, ${user.email}';

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String displayName) async {
    this.registering = true;
    try {
      var user = (await _firebaseAuth.createUserWithEmailAndPassword(
              email: email, password: password))
          .user;
      await user.updateProfile(displayName: displayName);
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

  Future<User> signInWithEmailAndPassword(String email, String password) async {
    this.logginIn = true;
    notifyListeners();
    try {
      var user = (await _firebaseAuth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      this.user = user;
      this.loginError = false;
      return user;
    } catch (e) {
      this.loginError = true;
      this.loginErrorMessage = "An error occured while trying to sign in";
      return e;
    } finally {
      this.logginIn = false;
      print('Test');
      notifyListeners();
    }
  }

  Future<void> signOut() {
    _firebaseAuth.signOut();
    notifyListeners();
  }
}
