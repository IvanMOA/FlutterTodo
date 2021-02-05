import 'package:flutter/material.dart';
import 'package:todolist/src/helpers/ColorsTolary.dart';
import 'package:todolist/src/helpers/validators.dart';

class AuthTextFormField extends StatelessWidget {
  TextEditingController controller;
  ValidatorFn validator;
  AuthTextFormField({TextEditingController controller, ValidatorFn validator}) {
    this.controller = controller;
    this.validator = validator;
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: ColorsTolary.TolaryPink,
      decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsTolary.TolaryGreen)),
          labelStyle: TextStyle(color: ColorsTolary.TolaryBlack),
          hintText: 'Enter your email',
          labelText: 'Email'),
      validator: validator,
    );
  }
}
