import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:todolist/src/helpers/validators.dart';
import 'package:todolist/src/models/auth.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String email;
  void setEmail(String email) => this.email = email;
  String password;
  void setPassword(String password) => this.password = password;

  Widget build(BuildContext context) {
    final Auth auth = Provider.of<Auth>(context);
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
                  validator: EmailValidator.validate),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8),
              ),
              // Password
              TextFormField(
                  decoration: InputDecoration(hintText: "Enter your password"),
                  onSaved: setPassword,
                  validator: PasswordValidator.validate),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: RaisedButton(
                    onPressed: () async {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        await auth.signInWithEmailAndPassword(
                            this.email, this.password);
                        // Navigator.pushNamed(context, '/');
                      }
                    },
                    child: Text("Sign in")),
              )
            ],
          ),
        ));
  }
}
