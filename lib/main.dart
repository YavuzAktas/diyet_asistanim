import 'package:diyet_asistanim/firebase_options.dart';
import 'package:diyet_asistanim/product/constants/string_constants.dart';
import 'package:diyet_asistanim/product/initialize/app_theme.dart';
import 'package:diyet_asistanim/product/initialize/application_start.dart';
import 'package:diyet_asistanim/product/initialize/label_overrides.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_localizations/firebase_ui_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'feature/auth/authentication_view.dart';
import 'feature/home/home_view.dart';
import 'feature/splash/splash_view.dart';

Future<void> main() async {
  await ApplicationStart.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        FirebaseUILocalizations.withDefaultOverrides(const LabelOverrides()),

        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,

        FirebaseUILocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('tr'),
      ],
      title: StringConstants.appName,
      home: const AuthenticationView(),
      theme: AppTheme(context).theme,
    );
  }
}
