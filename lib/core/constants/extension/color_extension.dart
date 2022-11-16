import 'package:flutter/material.dart';

extension ColorExtension on BuildContext {
  Color get white => Colors.white;
  Color get black => Colors.black;

  Color get chasm => const Color(0xFF8F5F43);
  Color get heatherGrey => const Color(0xFF9D9EA3);
  Color get blackChesnut => const Color(0xFF272422);

  Color get mediumBlack => const Color.fromARGB(144, 0, 0, 0);
}