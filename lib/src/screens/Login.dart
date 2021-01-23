import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String Email;
  void setEmail(String email) => this.Email = email;
  String Password;
  void setPassword(String password) => this.Password = password;

  String validateEmail(String email) {
    if (email == '') return 'Please enter an email';
    return null;
  }

  String validatePassword(String password) {
    if (password == '') return 'Please enter a password';
    return null;
  }

  void onSubmit() {
    print(this.Email);
    print(this.Password);
    this.signIn();
  }

  Future<void> signIn() async {
    var _auth = FirebaseAuth.instance;
    if (_auth.currentUser != null) return print("Already logged in");
    try {
      await _auth.signInWithEmailAndPassword(
          email: this.Email, password: this.Password);
      print("Succesful sign in");
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 50, left: 50),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Email
              TextFormField(
                  decoration: InputDecoration(hintText: "Enter your email"),
                  onSaved: setEmail,
                  validator: validateEmail),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              // Password
              TextFormField(
                  decoration: InputDecoration(hintText: "Enter your password"),
                  onSaved: setPassword,
                  validator: validatePassword),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        this.onSubmit();
                      }
                    },
                    child: Text("Sign in")),
              )
            ],
          ),
        ));
  }
}
