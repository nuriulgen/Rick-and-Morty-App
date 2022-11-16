import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_app/ui/home/home_view.dart';
import 'package:provider/provider.dart';

import 'core/init/theme/theme_notifier.dart';
import 'product/init/product_init.dart';

void main() {
  final productInit = ProductInit();
  runApp(
    MultiProvider(
      providers: productInit.providers,
      builder: (context, child) => const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rick and Morty',
      home: const HomeView(),
      theme: context.watch<ThemeNotifier>().currentTheme,
    );
  }
}
