import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:uni_flutter/src/pages/login_page.dart';
import 'package:uni_flutter/src/pages/main_page.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  static const _flutterSecureStorage = FlutterSecureStorage();

  Widget nextPage = const LoginPage();

  void _setNextPage(String? loginInfo) {
    setState(() {
      if (loginInfo != null) {
        nextPage = const MainPage();
      }
    });
  }

  _getFlutterSecureStorageInfo() async {
    String? loginInfo = await _flutterSecureStorage.read(key: 'login');
    _setNextPage(loginInfo);
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getFlutterSecureStorageInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: nextPage,
    );
  }
}
