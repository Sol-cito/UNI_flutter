import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_flutter/main.dart';

void main() {
  testWidgets("check MyApp widget initialization", (tester) async {
    final locales = [const Locale('en', 'US')];

    SharedPreferences.setMockInitialValues({"locale": "yes"});

    await EasyLocalization.ensureInitialized();

    await tester.pumpWidget(EasyLocalization(
      supportedLocales: locales,
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ));

    final myApp = find.byWidgetPredicate((widget) => widget is MyApp);
    final materialApp = find.byWidgetPredicate((widget) =>
        widget is MaterialApp && widget.supportedLocales == locales);

    expect(myApp, findsOneWidget);
    expect(materialApp, findsOneWidget);
  });
}
