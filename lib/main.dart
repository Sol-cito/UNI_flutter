import 'package:flutter/material.dart';
import 'package:uni_flutter/src/pages/HomePage.dart';

Future<void> main() async {
  bool tempData = await fetchLoginData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}

Future<bool> fetchLoginData() async {
  bool data = false;

  await Future.delayed(const Duration(seconds: 1), () {
    data = true;
  });
  return data;
}
