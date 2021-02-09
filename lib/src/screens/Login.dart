import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todolist/src/helpers/ColorsTolary.dart';
import 'package:todolist/src/helpers/validators.dart';
import 'package:todolist/src/models/auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todolist/src/screens/AuthModals/SignInModal.dart';
import 'package:todolist/src/screens/AuthModals/SignUpModal.dart';

class Login extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(children: [
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Tolar',
                        style: GoogleFonts.sourceCodePro(
                            color: ColorsTolary.TolaryBlack, fontSize: 50)),
                    TextSpan(
                        text: 'y',
                        style: GoogleFonts.sourceCodePro(
                            color: ColorsTolary.TolaryPink, fontSize: 50))
                  ])),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  Container(
                      width: constraints.maxWidth * 0.8,
                      child: Image.asset('lib/src/assets/logo.png')),
                  Padding(padding: EdgeInsets.symmetric(vertical: 15)),
                  TextButton(
                    onPressed: () =>
                        SignInModal.showSignInModal(context, SignInModal()),
                    style: TextButton.styleFrom(
                        backgroundColor: ColorsTolary.TolaryBlack,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10)),
                    child: Text(
                      'Sign in',
                      style: TextStyle(color: ColorsTolary.TolaryGray),
                      textScaleFactor: 1.5,
                    ),
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                  TextButton(
                    onPressed: () =>
                        SignUpModal.showSignUpModal(context, SignUpModal()),
                    child: Text(
                      'Sign up',
                      style: TextStyle(color: ColorsTolary.TolaryBlack),
                      textScaleFactor: 1.5,
                    ),
                  )
                ],
              );
            },
          ),
        )
      ]),
    );
  }
}
