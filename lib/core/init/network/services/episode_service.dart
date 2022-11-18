import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../model/episode_model.dart';
import 'entities_service.dart';

import '../../../constants/app/app_constants.dart';

class EpisodeService extends EntitiesService {
  final String baseURL = dotenv.env['BASE_URL'] ?? 'BASE_URL not found';
  
  Future<List<Episode>> fetchEpisode() async {
    List<Map<String, dynamic>> result =
        await super.fetchEntities('$baseURL${AppConstants.episodeEndpoint}');

    return List<Episode>.from(result.map((e) => Episode.fromJson(e)));
  }
}
