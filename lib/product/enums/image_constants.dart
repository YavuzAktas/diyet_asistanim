enum IconConstants {
  like('ic_like');

  final String value;
  const IconConstants(this.value);

  String get toPng => 'assets/icon/$value.png';
}