import 'package:flutter/cupertino.dart';

class MyColors{
  static final main_color=Color.fromRGBO(56, 142, 255, 1.0);
  static final black=Color.fromRGBO(0, 0, 0, 1.0);
  static final white=Color.fromRGBO(255, 255, 255, 1.0);
  static final none=Color.fromRGBO(255, 255, 255, 0.0);
  static final high=Color.fromRGBO(255, 32, 32, 1.0);
  static final low=Color.fromRGBO(26, 180, 4, 1.0);
  static final medium=Color.fromRGBO(255, 102, 0, 1.0);

}

extension HexColor on Color {
  /// String is in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /// Prefixes a hash sign if [leadingHashSign] is set to `true` (default is `true`).
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}