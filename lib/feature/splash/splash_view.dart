import 'package:diyet_asistanim/product/constants/string_constants.dart';
import 'package:diyet_asistanim/product/enums/image_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../product/widget/text/wavy_bold_text.dart';

class SplashView extends ConsumerWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            IconConstants.logo.toImage,
            const WavyBoldText(title: StringConstants.appName),
          ],
        ),
      ),
    );
  }
}
