import 'package:diyet_asistanim/feature/auth/authentication_provider.dart';
import 'package:diyet_asistanim/product/constants/string_constants.dart';
import 'package:diyet_asistanim/product/widget/text/description_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart' as firebase;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../product/enums/image_constants.dart';
import '../../product/widget/text/header_text.dart';

class AuthenticationView extends ConsumerStatefulWidget {
  const AuthenticationView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenticationViewState();
}

class _AuthenticationViewState extends ConsumerState<AuthenticationView> {

  final authProvider = StateNotifierProvider<AuthenticationNotifier, AuthenticationState>((ref) {
    return AuthenticationNotifier();
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: firebase.FirebaseUIActions(
        actions: [
          AuthStateChangeAction<SignedIn>((context, state) {
            if (state.user != null) {
              print('Okey');
            } else {
              Navigator.pushReplacementNamed(context, '/profile');
            }
          }),
        ],
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconConstants.logo.toImage,
                const TextHeader(title: StringConstants.appName),
                const DescriptionText(title: 'Alanında Uzman Diyetisyenler'),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: firebase.LoginView(
                      action: AuthAction.signIn,
                      providers: firebase.FirebaseUIAuth.providersFor(FirebaseAuth.instance.app),
                    showTitle: false,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}
