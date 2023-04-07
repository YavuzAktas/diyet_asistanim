

import 'package:diyet_asistanim/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
@immutable
class AppTheme {
  const AppTheme(this.context);
  final BuildContext context;

  ThemeData get theme => ThemeData.light().copyWith(
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          padding: MaterialStateProperty.all<EdgeInsets>(
            const EdgeInsets.all(18),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(ColorConstants.greenCrayola),
          foregroundColor: MaterialStateProperty.all<Color>(ColorConstants.white),
        ),
      ),
  );
}