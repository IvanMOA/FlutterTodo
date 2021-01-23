import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(right: 50, left: 50),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                decoration: InputDecoration(hintText: "Enter your email"),
                validator: (email) {
                  if (email == '') {
                    return 'Please enter an email';
                  }
                  return null;
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 16),
                child: RaisedButton(
                    onPressed: () {
                      if (_formKey.currentState.validate()) {}
                    },
                    child: Text("Sign in")),
              )
            ],
          ),
        ));
  }
}
