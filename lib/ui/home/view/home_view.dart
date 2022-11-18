import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_app/product/util/widget/custom_app_bar.dart';
import 'package:flutter_rick_and_morty_app/ui/home/viewmodel/home_view_model.dart';

import '../../../product/util/widget/custom_card.dart';
import '../../../core/init/network/model/characters_model.dart';
import 'home_detail.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _MyHomePageState();
}

class _MyHomePageState extends HomeViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarTitle(),
      body: FutureBuilder(
        future: characters,
        builder: (_, AsyncSnapshot<List<Character>> snapshot) {
          if (snapshot.hasData) {
            final dataResults = snapshot.data!;
            return _characterList(dataResults, context);
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  GridView _characterList(List<Character> dataResults, BuildContext context) {
    return GridView.builder(
            itemBuilder: (_, index) {
              final character = dataResults[index];
              return CustomCard(
                title: character.name,
                lastLocation: character.location.name,
                imageUrl: character.image,
                status: character.status,
                onTap: () {
                  _navigationDetailPage(context, character);
                },
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 6.0 / 9.0,
            ),
            itemCount: dataResults.length,
          );
  }

  Future<dynamic> _navigationDetailPage(
      BuildContext context, Character character) {
    return Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HomeDetailView(detailedCharacter: character),
      ),
    );
  }

  CustomAppBar _appBarTitle() =>
      CustomAppBar(title: appStringConstants!.characterTitle);
}
