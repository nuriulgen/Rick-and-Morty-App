import 'package:flutter/material.dart';

import '../../../core/constants/extension/string_extension.dart';
import '../../../core/init/network/model/episode_model.dart';
import '../../../core/init/network/services/episode_service.dart';
import '../view/episode_view.dart';

abstract class EpisodeViewModel extends State<EpisodeView> {
  final AppStringConstants? appStringConstants = AppStringConstants.instance;

  Future<List<Episode>>? episode;

  @override
  void initState() {
    episode = EpisodeService().fetchEpisode();
    super.initState();
  }
}
