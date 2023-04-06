import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextHeader extends StatelessWidget {
  final String? title;
  const TextHeader({Key? key, this.title}) : super(key: key);

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
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
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
