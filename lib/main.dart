import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/theme/theme_notifier.dart';
import 'product/constants/bottom_navigation_bar.dart';
import 'product/init/project_init.dart';

Future main() async {
  await dotenv.load(fileName: '.env'); // .env reading data in file.
  final projectInit = ProjectInit();
  runApp(
    MultiProvider(
      providers: projectInit.providers,
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
      title: AppConstants.appTitle,
      home: const CustomBottomNavigationBar(),
      theme: context.watch<ThemeNotifier>().currentTheme,
    );
  }
}
