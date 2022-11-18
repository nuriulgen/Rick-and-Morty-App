import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppConstants {
  static const appTitle = 'Rick and Morty';

  final String baseURL = dotenv.env['BASE_URL'] ?? 'BASE_URL not found';
  static const characterEndpoint = "character";
  static const episodeEndpoint = "episode";
}
