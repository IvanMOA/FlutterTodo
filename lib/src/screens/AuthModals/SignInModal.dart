import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/src/helpers/ColorsTolary.dart';
import 'package:todolist/src/helpers/validators.dart';
import 'package:todolist/src/models/auth.dart';
import 'package:todolist/src/screens/AuthModals/AuthTextFormField.dart';

class SignInModal extends StatelessWidget {
  static void showSignInModal(BuildContext context, Widget widget) {
    // Scaffold.of(context).sho((context) => widget);
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
        height: 300,
        padding: EdgeInsets.all(20),
        width: totalWidth,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
        ], color: Colors.white),
        child: Column(
          children: [
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
                      controller: auth.password,
                      validator: PasswordValidator.validate,
                      hintText: 'Enter your password',
                      label: 'Password',
                    )
                  ],
                )),
            Padding(padding: EdgeInsets.symmetric(vertical: 15)),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                    onPressed: () async {
                      if (auth.signinFormKey.currentState.validate()) {
                        await auth.signInWithEmailAndPassword(
                            auth.email.text, auth.password.text);
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: ColorsTolary.TolaryGray,
                    ),
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
