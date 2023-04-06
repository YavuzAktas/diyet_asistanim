import 'package:diyet_asistanim/product/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DescriptionText extends StatelessWidget {
  final String? title;
  const DescriptionText({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title!,
                  style: GoogleFonts.rubik(
                    fontSize: 14,
                    color: Colors.grey..shade400,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
