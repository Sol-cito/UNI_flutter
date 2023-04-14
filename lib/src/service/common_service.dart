class CommonService {
  bool validateEmailByRegex(String emailAddressCandidate) {
    return RegExp(
            r"^[a-zA-Z\d.a-zA-Z\d.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
        .hasMatch(emailAddressCandidate);
  }

  bool validatePasswordByRegex(String passwordCandidate) {
    // Minimum 1 Uppercase, 1 lowercase, 1 numeric, 1 special char
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,12}$')
        .hasMatch(passwordCandidate);
  }
}
