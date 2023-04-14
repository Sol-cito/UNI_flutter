import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uni_flutter/src/components/common_app_bar.dart';
import 'package:uni_flutter/src/components/cust_text_field.dart';
import 'package:uni_flutter/src/service/common_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final commonService = CommonService();

  bool _isEmailInvalid = false;
  final String _emailErrorText = "email error text";

  bool _isPasswordInvalid = false;
  final String _passwordErrorText = "password error text";

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _verifyEmail() {
    if (!commonService.validateEmailByRegex(_emailController.text)) {
      setState(() {
        _isEmailInvalid = true;
      });
    } else {
      setState(() {
        _isEmailInvalid = false;
      });
    }
  }

  void _verifyPassword() {
    if (!commonService.validatePasswordByRegex(_passwordController.text)) {
      setState(() {
        _isPasswordInvalid = true;
      });
    } else {
      setState(() {
        _isPasswordInvalid = false;
      });
    }
  }

  void _onPressRegister() {
    if (_isEmailInvalid || _isPasswordInvalid) {
      Fluttertoast.showToast(msg: "입력값을 확인해주세요.");
      return;
    }
    // TO-DO
    Fluttertoast.showToast(msg: "가입 gogo!!");
  }

  @override
  Widget build(BuildContext context) {
    final String emailHintText = "login".tr(gender: "email");
    final String passwordHintText = "login".tr(gender: "password");

    return MaterialApp(
        home: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: CommonAppBar(
          title: "login".tr(gender: "login_title"), showLeading: false),
      body: Container(
          color: Colors.blue,
          child: Container(
            margin: const EdgeInsets.only(top: 50),
            child: Column(children: [
              Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  child: Text("login".tr(gender: "login_content"),
                      style: const TextStyle(fontSize: 25),
                      textAlign: TextAlign.center)),
              Container(
                  margin: const EdgeInsets.all(15),
                  child: Focus(
                      onFocusChange: (value) => {if (!value) _verifyEmail()},
                      child: CustTextField(
                        textEditingController: _emailController,
                        isInputInvalid: _isEmailInvalid,
                        errorText: _emailErrorText,
                        hintText: emailHintText,
                      ))),
              Container(
                margin: const EdgeInsets.all(15),
                child: Focus(
                    onFocusChange: (value) => {if (!value) _verifyPassword()},
                    child: CustTextField(
                      textEditingController: _passwordController,
                      isInputInvalid: _isPasswordInvalid,
                      errorText: _passwordErrorText,
                      hintText: passwordHintText,
                      isObscure: true,
                    )),
              )
            ]),
          )),
      bottomSheet: Container(
          color: Colors.blue,
          child: Container(
              margin: const EdgeInsets.all(15),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text("login".tr(gender: "register_content"),
                    style: const TextStyle(fontSize: 17),
                    textAlign: TextAlign.center),
                const SizedBox(width: 10),
                TextButton(
                    onPressed: _onPressRegister,
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 17),
                        foregroundColor: Colors.yellow),
                    child: Text(
                      "login".tr(gender: "create_account"),
                    ))
              ]))),
    ));
  }
}
