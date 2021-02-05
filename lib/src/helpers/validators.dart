abstract class Validator {
  static validate(String value) {}
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
