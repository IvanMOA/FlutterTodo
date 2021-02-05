typedef String ValidatorFn(String value);

abstract class Validator {
  static ValidatorFn validate;
}

class EmailValidator implements Validator {
  static String validate(String value) {
    return value.isEmpty ? "Email can't be empty" : null;
  }
}

class PasswordValidator implements Validator {
  static String validate(String value) {
    return value.isEmpty ? "Password can't be empty" : null;
  }
}
