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

  late final emailFocusNode = FocusNode();
  late final passwordFocusNode = FocusNode();

  bool _isEmailInvalid = false;
  bool _isPasswordEmpty = false;

  @override
  void initState() {
    super.initState();
    emailFocusNode.addListener(() {
      if (!emailFocusNode.hasFocus) {
        _verifyEmail();
      }
    });
    passwordFocusNode.addListener(() {
      if (!passwordFocusNode.hasFocus) {
        _verifyPasswordEmptiness();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
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

  void _onChangePassword(String input) {
    if (input.isNotEmpty) {
      setState(() {
        _isPasswordEmpty = false;
      });
    }
  }

  void _verifyPasswordEmptiness() {
    setState(() {
      _isPasswordEmpty = _passwordController.text.isEmpty;
    });
  }

  void _onPressRegister() {
    // TO-DO : register
    Fluttertoast.showToast(msg: "TO-DO : register");
  }

  void _onPressLogin() {
    _verifyEmail();
    _verifyPasswordEmptiness();
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
    if (_isEmailInvalid || _emailController.text.isEmpty) {
      emailFocusNode.requestFocus();
      return;
    }
    if (_isPasswordEmpty || _passwordController.text.isEmpty) {
      passwordFocusNode.requestFocus();
      return;
    }
    // TO-DO : login
  }

  void _onTapOnScreenGesture() {
    emailFocusNode.unfocus();
    passwordFocusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    final String emailHintText = "login".tr(gender: "email");
    final String passwordHintText = "login".tr(gender: "password");

    return GestureDetector(
      onTap: _onTapOnScreenGesture,
      child: MaterialApp(
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
                    child: CustTextField(
                      onChange: _onChangeEmail,
                      focusNode: emailFocusNode,
                      textEditingController: _emailController,
                      isInputInvalid: _isEmailInvalid,
                      errorText: "validation".tr(gender: "invalid_email"),
                      hintText: emailHintText,
                    )),
                Container(
                  margin: const EdgeInsets.all(15),
                  child: CustTextField(
                    onChange: _onChangePassword,
                    focusNode: passwordFocusNode,
                    textEditingController: _passwordController,
                    isInputInvalid: _isPasswordEmpty,
                    errorText: "validation".tr(gender: "empty_password"),
                    hintText: passwordHintText,
                    isObscure: true,
                    maxLength: 15,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                  child: SizedBox(
                      width: double.maxFinite,
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black),
                        onPressed: _onPressLogin,
                        child: Text("login".tr(gender: "login_btn"),
                            style: const TextStyle(fontSize: 25)),
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
      )),
    );
  }
}
