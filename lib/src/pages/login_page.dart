import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:uni_flutter/src/components/common_app_bar.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userid = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _userid.dispose();
    _password.dispose();
  }

  InputDecoration _getInputDecoration(String placeholder) {
    return InputDecoration(
        hintText: placeholder,
        focusedErrorBorder:
            const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black)),
        filled: true,
        fillColor: Colors.lightBlue);
  }

  void _onPressRegister() {
    // TO-DO
    Fluttertoast.showToast(msg: "Let's go to registration page");
  }

  void _verifyEmail(String input) {
    // TO-DO
  }

  void _verifyPassword(String input) {
    // TO-DO
  }

  @override
  Widget build(BuildContext context) {
    final String email = "login".tr(gender: "email");
    final String password = "login".tr(gender: "password");

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
                      child: TextField(
                          onChanged: _verifyEmail,
                          cursorColor: Colors.black,
                          controller: _userid,
                          decoration: _getInputDecoration(email))),
                  Container(
                      margin: const EdgeInsets.all(15),
                      child: TextField(
                        onChanged: _verifyPassword,
                        cursorColor: Colors.black,
                        controller: _password,
                        decoration: _getInputDecoration(password),
                        obscureText: true,
                      )),
                ]),
              )),
          bottomSheet: Container(
              color: Colors.blue,
              child: Container(
                  margin: const EdgeInsets.all(15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                      ])))),
    );
  }
}
