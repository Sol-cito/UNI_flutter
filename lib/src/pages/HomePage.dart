import 'package:flutter/material.dart';
import 'package:uni_flutter/src/components/HomeAppBar.dart';

import '../components/BottomNavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final String appImageDir = "assets/un_flag.png";

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
          appBar: HomeAppBar(),
          body: Text("Test"),
          bottomNavigationBar: BottomNavBar()),
    );
  }
}
