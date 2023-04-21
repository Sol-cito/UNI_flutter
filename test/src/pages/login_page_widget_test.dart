import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:uni_flutter/src/components/common_app_bar.dart';
import 'package:uni_flutter/src/pages/login_page.dart';

void main() {
  group("Display and attributes test", () {
    testWidgets("All the widgets display", (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final appBar = find.byType(CommonAppBar);
      final loginContent = find.text("login".tr(gender: "login_content"));
      final emailAndPasswordTextFields = find.byType(TextField);
      final registerButton = find.byType(TextButton);
      final loginButton = find.byType(ElevatedButton);

      expect(appBar, findsOneWidget);
      expect(loginContent, findsOneWidget);
      expect(emailAndPasswordTextFields, findsNWidgets(2));
      expect(registerButton, findsOneWidget);
      expect(loginButton, findsOneWidget);
    });

    testWidgets("Check email and password field attributes",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final emailTextField = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.hintText == "login".tr(gender: "email") &&
          widget.focusNode != null &&
          widget.cursorColor == Colors.black &&
          widget.obscureText == false &&
          widget.maxLength == null);

      final passwordTextField = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.hintText == "login".tr(gender: "password") &&
          widget.focusNode != null &&
          widget.cursorColor == Colors.black &&
          widget.obscureText == true &&
          widget.maxLength == 15);

      expect(emailTextField, findsOneWidget);
      expect(passwordTextField, findsOneWidget);
    });
  });

  group("Email and password fields' error text test", () {
    testWidgets(
        "Both email and password error texts pop up when clicking login button right away, and the focus is given to the email field",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());
      final loginButton = find.byType(ElevatedButton);

      await widgetTester.tap(loginButton);
      await widgetTester.pumpAndSettle();

      final emailErrorText = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.errorText != null &&
          widget.focusNode?.hasFocus == true &&
          widget.decoration?.errorText ==
              "validation".tr(gender: "invalid_email"));

      final passwordErrorText = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.errorText != null &&
          widget.focusNode?.hasFocus == false &&
          widget.decoration?.errorText ==
              "validation".tr(gender: "empty_password"));

      expect(emailErrorText, findsOneWidget);
      expect(passwordErrorText, findsOneWidget);
    });

    testWidgets(
        "Email text field has focus on when clicking login button if password field is filled",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());
      final passwordTextField = find.byType(TextField).last;
      final loginButton = find.byType(ElevatedButton);

      await widgetTester.enterText(passwordTextField, "password");
      await widgetTester.tap(loginButton);
      await widgetTester.pumpAndSettle();

      final emailErrorText = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.errorText != null &&
          widget.focusNode?.hasFocus == true &&
          widget.decoration?.errorText ==
              "validation".tr(gender: "invalid_email"));

      expect(emailErrorText, findsOneWidget);
    });

    testWidgets("Email error message appears without focus when input is empty",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final emailTextField = find.byType(TextField).first;
      final passwordTextField = find.byType(TextField).last;

      await widgetTester.enterText(emailTextField, "");
      await widgetTester.tap(passwordTextField);
      await widgetTester.pumpAndSettle();

      final emailErrorText = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.errorText != null &&
          widget.focusNode?.hasFocus == false &&
          widget.decoration?.errorText ==
              "validation".tr(gender: "invalid_email"));

      expect(emailErrorText, findsOneWidget);
    });

    testWidgets(
        "Email error message appears without focus when input is invalid",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final emailTextField = find.byType(TextField).first;
      final passwordTextField = find.byType(TextField).last;

      await widgetTester.enterText(emailTextField, "invalid email");
      await widgetTester.tap(passwordTextField);
      await widgetTester.pumpAndSettle();

      final emailErrorText = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.errorText != null &&
          widget.focusNode?.hasFocus == false &&
          widget.decoration?.errorText ==
              "validation".tr(gender: "invalid_email"));

      expect(emailErrorText, findsOneWidget);
    });

    testWidgets("Email error message doesn't appear when input is valid",
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

    testWidgets(
        "Email error message disappears when invalid email gets corrected",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final emailTextField = find.byType(TextField).first;
      final passwordTextField = find.byType(TextField).last;

      await widgetTester.enterText(emailTextField, "invalid email");
      await widgetTester.tap(passwordTextField);
      await widgetTester.pumpAndSettle();

      final emailErrorText = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.errorText != null &&
          widget.decoration?.errorText ==
              "validation".tr(gender: "invalid_email"));

      expect(emailErrorText, findsOneWidget);

      await widgetTester.enterText(emailTextField, "validemail@email.com");
      await widgetTester.pumpAndSettle();

      expect(emailErrorText, findsNothing);
    });

    testWidgets(
        "Password text field has focus on when clicking login button if email is valid and the password is empty",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());
      final emailTextField = find.byType(TextField).first;
      final loginButton = find.byType(ElevatedButton);

      await widgetTester.enterText(emailTextField, "valid@email.com");
      await widgetTester.tap(loginButton);
      await widgetTester.pumpAndSettle();

      final passwordErrorText = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.errorText != null &&
          widget.focusNode?.hasFocus == true &&
          widget.decoration?.errorText ==
              "validation".tr(gender: "empty_password"));

      expect(passwordErrorText, findsOneWidget);
    });

    testWidgets(
        "Password error message disappears when the field becomes not empty",
        (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());
      final emailTextField = find.byType(TextField).first;
      final passwordTextField = find.byType(TextField).last;
      final loginButton = find.byType(ElevatedButton);

      await widgetTester.enterText(emailTextField, "valid@email.com");
      await widgetTester.tap(loginButton);
      await widgetTester.pumpAndSettle();

      final passwordErrorText = find.byWidgetPredicate((widget) =>
          widget is TextField &&
          widget.decoration?.errorText != null &&
          widget.focusNode?.hasFocus == true &&
          widget.decoration?.errorText ==
              "validation".tr(gender: "empty_password"));

      expect(passwordErrorText, findsOneWidget);

      await widgetTester.enterText(passwordTextField, "password");
      await widgetTester.pumpAndSettle();

      expect(passwordErrorText, findsNothing);
    });
  });

  group("Login button test", () {
    testWidgets("Check login button attributes", (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final loginButton = find.byWidgetPredicate(
          (widget) => widget is ElevatedButton && widget.child is Text);

      final loginButtonTextChild = find.byWidgetPredicate((widget) =>
          widget is Text && widget.data == "login".tr(gender: "login_btn"));

      expect(loginButton, findsOneWidget);
      expect(loginButtonTextChild, findsOneWidget);
    });
  });

  group("Register button test", () {
    testWidgets("Check register text button attributes", (widgetTester) async {
      await widgetTester.pumpWidget(const LoginPage());

      final registerTextButton = find.byWidgetPredicate(
          (widget) => widget is TextButton && widget.child is Text);
      final registerButtonTextChild = find.byWidgetPredicate((widget) =>
          widget is Text &&
          widget.data == "login".tr(gender: "create_account"));

      expect(registerTextButton, findsOneWidget);
      expect(registerButtonTextChild, findsOneWidget);
    });
  });
}
