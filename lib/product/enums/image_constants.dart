import 'package:flutter/cupertino.dart';

enum IconConstants {
  ellipse1('ic_ellipse1'),
  ellipse2('ic_ellipse2'),
  ellipse3('ic_ellipse3'),
  back('ic_back'),
  logo('ic_logo'),
  background('ic_background');

  final String value;
  // ignore: sort_constructors_first
  const IconConstants(this.value);

  String get toPng => 'assets/icon/$value.png';
  Image get toImage => Image.asset(toPng);
}