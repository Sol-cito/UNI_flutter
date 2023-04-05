import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uni_flutter/src/components/common_app_bar.dart';
import 'package:uni_flutter/src/pages/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userid = TextEditingController();
  final TextEditingController _password = TextEditingController();

  static const _flutterSecureStorage = FlutterSecureStorage();

  void _divergeToPage(String? loginInfo) {
    setState(() {
      if (loginInfo != null) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getFlutterSecureStorageInfo();
    });
  }

  _getFlutterSecureStorageInfo() async {
    String? loginInfo = await _flutterSecureStorage.read(key: 'login');
    _divergeToPage(loginInfo);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: CommonAppBar(
            title: "login".tr(gender: "login_title"), showLeading: false),
        body: Container(
          color: Colors.blue,
          child: Column(children: [
            TextField(
              controller: _userid,
              decoration:
                  InputDecoration(labelText: "login".tr(gender: "email")),
            ),
            TextField(
              controller: _password,
              decoration:
                  InputDecoration(labelText: "login".tr(gender: "password")),
              obscureText: true,
            )
          ]),
        ),
      ),
    );
  }
}
