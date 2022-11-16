import 'package:provider/provider.dart';

import '../../core/init/theme/theme_notifier.dart';

class ProductInit {
  final List<ChangeNotifierProvider<ThemeNotifier>> providers = [
    ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
  ];
}
