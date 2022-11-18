import 'package:flutter/material.dart';
import '../../../core/init/network/model/episode_model.dart';
import '../viewmodel/episode_viewmodel.dart';
import '../../../product/util/widget/custom_app_bar.dart';
import '../../../product/util/widget/custom_list_tile.dart';

class EpisodeView extends StatefulWidget {
  const EpisodeView({Key? key}) : super(key: key);
  @override
  State<EpisodeView> createState() => _EpisodeViewState();
}

class _EpisodeViewState extends EpisodeViewModel {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: appStringConstants!.episodeTitle),
      body: FutureBuilder(
        future: episode,
        builder: (_, AsyncSnapshot<List<Episode>> snapshot) {
          if (snapshot.hasData) {
            final dataResults = snapshot.data!;
            return _EpisodeList(dataResults: dataResults);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class _EpisodeList extends StatelessWidget {
  const _EpisodeList({
    Key? key,
    required this.dataResults,
  }) : super(key: key);

  final List<Episode> dataResults;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      final results = dataResults[index];
      return _customList(results);
    });
  }

  CustomListTile _customList(Episode results) {
    return CustomListTile(
        title: results.name,
        subTitle: results.episode,
        airDate: results.airDate);
  }
}
