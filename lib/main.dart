import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:uni_flutter/src/pages/init_page.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");

  await EasyLocalization.ensureInitialized();

  final locales = [const Locale('en', 'US')];

  runApp(EasyLocalization(
    supportedLocales: locales,
    path: 'assets/translations',
    fallbackLocale: const Locale('en', 'US'),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const InitPage(),
    );
  }
}
