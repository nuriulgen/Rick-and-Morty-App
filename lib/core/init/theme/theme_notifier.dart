import 'package:flutter/material.dart';

import 'custom_theme.dart';

class ThemeNotifier extends ChangeNotifier {
  bool isLightTheme = false;

  void changeTheme() {
    isLightTheme = !isLightTheme;
    notifyListeners(); // used to listen for theme change.
  }

  ThemeData get currentTheme => isLightTheme
      ? CustomTheme.instance.lightTheme
      : CustomTheme.instance.darkTheme;
}