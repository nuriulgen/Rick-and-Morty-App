import 'package:provider/provider.dart';

import '../../core/init/theme/theme_notifier.dart';

class ProjectInit {
  // Provider-State Management
  final List<ChangeNotifierProvider<ThemeNotifier>> providers = [
    //Used to enable theme change.
    ChangeNotifierProvider<ThemeNotifier>(create: (context) => ThemeNotifier())
  ];
}
