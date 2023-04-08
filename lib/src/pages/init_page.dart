import 'package:flutter/material.dart';
import 'package:uni_flutter/src/pages/login_page.dart';
import 'package:uni_flutter/src/pages/main_page.dart';

import '../service/storage_service.dart';

class InitPage extends StatefulWidget {
  const InitPage({Key? key}) : super(key: key);

  @override
  State<InitPage> createState() => _InitPageState();
}

class _InitPageState extends State<InitPage> {
  Widget nextPage = const LoginPage();
  StorageService storageService = StorageService();

  void _setNextPage() {
    setState(() {
      nextPage = const MainPage();
    });
  }

  _getNextPage() async {
    bool isAlreadyLoggedIn =
        await storageService.checkIfAlreadyLoggedInByStorage();
    if (isAlreadyLoggedIn) {
      _setNextPage();
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getNextPage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: nextPage,
    );
  }
}
