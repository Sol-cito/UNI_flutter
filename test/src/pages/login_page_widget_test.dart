import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni_flutter/src/components/common_app_bar.dart';
import 'package:uni_flutter/src/pages/login_page.dart';

void main() {
  group("Test login page elements", () {
    testWidgets("check if all the widgets display", (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final appBar = find.byType(CommonAppBar);
      final loginContent = find.text("login".tr(gender: "login_content"));
      final emailAndPasswordTextFields = find.byType(TextField);
      final registerButton = find.byType(TextButton);

      expect(appBar, findsOneWidget);
      expect(loginContent, findsOneWidget);
      expect(emailAndPasswordTextFields, findsNWidgets(2));
      expect(registerButton, findsOneWidget);
    });

    testWidgets("check email and password field attributes",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final emailTextField = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.hintText == "login".tr(gender: "email") &&
          widget.cursorColor == Colors.black &&
          widget.obscureText == false &&
          widget.maxLength == null);

      final passwordTextField = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.hintText == "login".tr(gender: "password") &&
          widget.cursorColor == Colors.black &&
          widget.obscureText == true &&
          widget.maxLength == 15);

      expect(emailTextField, findsOneWidget);
      expect(passwordTextField, findsOneWidget);
    });

    testWidgets(
        "test if email error message doesn't appear when input is valid",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final emailTextField = find.byType(TextField).first;
      final passwordTextField = find.byType(TextField).last;

      await widgetTester.enterText(emailTextField, "valid@valid.com");
      await widgetTester.tap(passwordTextField);
      await widgetTester.pumpAndSettle();

      final test = find.byWidgetPredicate((widget) =>
          widget is TextField && widget.decoration?.errorText != null);

      expect(test, findsNothing);
    });

    testWidgets("test if email error message appears when input is invalid",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final emailTextField = find.byType(TextField).first;
      final passwordTextField = find.byType(TextField).last;

      await widgetTester.enterText(emailTextField, "invalid email");
      await widgetTester.tap(passwordTextField);
      await widgetTester.pumpAndSettle();

      final test = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.errorText != null &&
          widget.decoration?.errorText ==
              "validation".tr(gender: "invalid_email"));

      expect(test, findsOneWidget);
    });

    testWidgets("check register text button attributes", (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final registerTextsButton = find.byWidgetPredicate(
          (widget) => widget is TextButton && widget.child is Text);
      expect(registerTextsButton, findsOneWidget);
    });
  });
}
