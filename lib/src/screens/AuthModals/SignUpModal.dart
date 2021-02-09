import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/src/helpers/ColorsTolary.dart';
import 'package:todolist/src/helpers/validators.dart';
import 'package:todolist/src/models/auth.dart';

import 'AuthTextFormField.dart';

class SignUpModal extends StatelessWidget {
  static void showSignUpModal(BuildContext context, Widget widget) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return Container(
            padding: MediaQuery.of(context).viewInsets,
            child: widget,
          );
        });
  }

  Widget build(BuildContext context) {
    var totalWidth = MediaQuery.of(context).size.width;
    final Auth auth = Provider.of<Auth>(context);
    return LayoutBuilder(
      builder: (context, constrains) => Container(
        height: 400,
        padding: EdgeInsets.all(20),
        width: totalWidth,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
        ], color: Colors.white),
        child: Column(
          children: [
            Positioned(
              left: 0,
              child: Text(
                'Create a new account',
                textScaleFactor: 1.5,
                textAlign: TextAlign.left,
              ),
            ),
            Form(
                key: auth.signinFormKey,
                child: Column(
                  children: [
                    AuthTextFormField(
                      controller: auth.email,
                      validator: EmailValidator.validate,
                      hintText: 'Enter your email',
                      label: 'Email',
                    ),
                    AuthTextFormField(
                      controller: auth.displayName,
                      validator: DisplayNameValidator.validate,
                      hintText: 'Your name goes here',
                      label: 'Name',
                    ),
                    AuthTextFormField(
                      controller: auth.password,
                      validator: PasswordValidator.validate,
                      hintText: 'Enter your password',
                      label: 'Password',
                    ),
                    AuthTextFormField(
                      controller: auth.confirmPassword,
                      validator: (uselessValue) =>
                          ConfirmationPasswordValidator.validate(
                              auth.password.text, auth.confirmPassword.text),
                      hintText: 'Enter your password again',
                      label: 'Confirm password',
                    ),
                  ],
                )),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () async {
                      if (auth.signinFormKey.currentState.validate()) {
                        await auth.createUserWithEmailAndPassword(
                            auth.email.text,
                            auth.password.text,
                            auth.displayName.text);
                      }
                    },
                    child: Text('Create account',
                        style: TextStyle(color: ColorsTolary.TolaryGray)),
                    style: TextButton.styleFrom(
                        backgroundColor: ColorsTolary.TolaryBlack))
              ],
            )
          ],
        ),
      ),
    );
  }
}
