class AppStringConstants {
  static AppStringConstants? _instance;
  static AppStringConstants? get instance {
    _instance ??= AppStringConstants._init();
    return _instance;
  }

  AppStringConstants._init();

  //STRING
  final String characterTitle = 'Characters';
  final String characterDetailTitle = 'Characters Detail';
  final String lastLocationText = 'Last Location:';
  final String episodeTitle = 'Episode List';
}
