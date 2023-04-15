import 'package:flutter_test/flutter_test.dart';
import 'package:uni_flutter/src/service/common_service.dart';

void main() {
  CommonService commonService = CommonService();

  group("Regex test", () {
    group("Email regex test", () {
      List<String> failExpectedResult = [
        "Test",
        "test@testcom",
        "testemail.com",
        "@test.com",
        "test@test.123",
        "test@123.123",
        "test@!.com",
        "test@test.!",
        "test@test,com",
        "test@{}.com"
      ];

      test("All the wrong inputs return false", () {
        for (String element in failExpectedResult) {
          bool result = commonService.validateEmailByRegex(element);
          expect(result, false);
        }
      });

      test("Correct email returns true", () {
        String correctEmail = "test@test.com";
        bool result = commonService.validateEmailByRegex(correctEmail);
        expect(result, true);
      });
    });

    group("Password regex test", () {
      List<String> failExpectedResult = [
        "testpass123!",
        "TESTPASS123!",
        "Testpass123",
        "Testpass!@#",
        "1234566!@#",
        "Test12!",
        "Testtesttes123!@",
        " ",
        "",
        "1"
      ];

      test("All the wrong inputs return false", () {
        for (String element in failExpectedResult) {
          bool result = commonService.validatePasswordByRegex(element);
          expect(result, false);
        }
      });

      test("Correct password returns true", () {
        String correctPassword = "Testpass123!";
        bool result = commonService.validatePasswordByRegex(correctPassword);
        expect(result, true);
      });
    });
  });
}
