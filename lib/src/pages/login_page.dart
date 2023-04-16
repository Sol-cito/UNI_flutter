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

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void _onChangeEmail(String input) {
    if (commonService.validateEmailByRegex(_emailController.text)) {
      setState(() {
        _isEmailInvalid = false;
      });
    }
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

  void _onPressRegister() {
    Fluttertoast.showToast(msg: "가입 gogo!!");
  }

  void _onPressLogin() {
    if (_isEmailInvalid) {
      Fluttertoast.showToast(msg: "입력값을 확인해주세요.");
      return;
    }
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
                        onChange: _onChangeEmail,
                        textEditingController: _emailController,
                        isInputInvalid: _isEmailInvalid,
                        errorText: "validation".tr(gender: "invalid_email"),
                        hintText: emailHintText,
                      ))),
              Container(
                margin: const EdgeInsets.all(15),
                child: Focus(
                    child: CustTextField(
                  textEditingController: _passwordController,
                  maxLength: 15,
                  hintText: passwordHintText,
                  isObscure: true,
                )),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: SizedBox(
                    width: double.maxFinite,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      onPressed: () {},
                      child: const Text(
                        "Login",
                        style: TextStyle(fontSize: 25),
                      ),
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
