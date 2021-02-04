import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/src/helpers/ColorsTolary.dart';

class SignInModal extends StatelessWidget {
  static void showSignInModal(BuildContext context, Widget widget) {
    Scaffold.of(context).showBottomSheet((context) => widget);
  }

  Widget build(BuildContext context) {
    var totalWidth = MediaQuery.of(context).size.width;
    print(totalWidth);
    return Container(
      height: 500,
      width: totalWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          boxShadow: [
            BoxShadow(color: Colors.black26, spreadRadius: 5, blurRadius: 5)
          ],
          color: Colors.white),
      child: Column(
        children: [Text('HOLA BRO'), Text('ASDASD')],
      ),
    );
  }
}
