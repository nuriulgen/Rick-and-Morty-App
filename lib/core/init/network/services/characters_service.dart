import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/characters_model.dart';
import '../../../constants/app/app_constants.dart';
import 'entities_service.dart';

class CharacterService extends EntitiesService {
  final String baseURL = dotenv.env['BASE_URL'] ?? 'BASE_URL not found';

  Future<List<CharacterModel>> fetchCharacters() async {
    // It was used to pull all the characters data from the api.
    List<Map<String, dynamic>> results =
        await super.fetchEntities('$baseURL${AppConstants.characterEndpoint}');

    return List<CharacterModel>.from(
        results.map((e) => CharacterModel.fromJson(e)));
  }
}
