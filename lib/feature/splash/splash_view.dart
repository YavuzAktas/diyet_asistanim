import 'package:diyet_asistanim/feature/home/home_view.dart';
import 'package:diyet_asistanim/feature/splash/splash_provider.dart';
import 'package:diyet_asistanim/product/constants/string_constants.dart';
import 'package:diyet_asistanim/product/enums/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';

import '../../product/widget/text/wavy_bold_text.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> with _SplashViewListenMixin{

  final splashProvider = StateNotifierProvider<SplashProvider, SplashState>((ref) {
    return SplashProvider();
  });

  @override
  void initState() {
    super.initState();

    ref.read(splashProvider.notifier).checkApplicationVersion(''.version);
  }

  @override
  Widget build(BuildContext context) {
    listenAndNavigate(splashProvider);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconConstants.logo.toImage,
            Padding(
                padding: context.onlyTopPaddingLow
            ),
            const WavyBoldText(title: StringConstants.appName),
          ],
        ),
      ),
    );
  }
}

mixin _SplashViewListenMixin on ConsumerState<SplashView> {
  void listenAndNavigate(StateNotifierProvider<SplashProvider, SplashState> provider) {
    ref.listen(provider, (previous, next) {
      if(next.isRequiredForceUpdate ?? false) {
        showAboutDialog(context: context);
        return;
      }

      if(next.isRedirectHome != null) {
        if(next.isRedirectHome!) {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeView())
          );
        } else {
          //false
        }
      }
    });
  }
}