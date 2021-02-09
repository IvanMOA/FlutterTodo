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

class ConfirmationPasswordValidator implements Validator {
  static String validate(String password, String confirmationPassword) {
    return password != confirmationPassword ? "Password doesn't match" : null;
  }
}

class DisplayNameValidator implements Validator {
  static String validate(String value) {
    return value.isEmpty ? "Your must enter your name" : null;
  }
}
