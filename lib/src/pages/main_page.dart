import 'package:flutter/material.dart';
import 'package:uni_flutter/src/components/Test.dart';
import 'package:uni_flutter/src/components/home_app_bar.dart';

import '../components/bottom_nav_bar.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  final String appImageDir = "assets/un_flag.png";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          appBar: HomeAppBar(),
          body: Test(),
          bottomNavigationBar: BottomNavBar()),
    );
  }
}
