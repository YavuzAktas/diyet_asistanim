import 'package:diyet_asistanim/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart' show GoogleProvider;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

@immutable
class ApplicationStart {
  const ApplicationStart._();
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await DeviceUtility.deviceInit();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );

    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      GoogleProvider(clientId: ''),
    ]);
  }
}