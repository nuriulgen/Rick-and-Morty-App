import 'package:flutter/material.dart';

import '../../../core/constants/extension/string_extension.dart';
import '../../../core/init/network/model/characters_model.dart';
import '../../../core/init/network/services/characters_service.dart';
import '../view/home_view.dart';

abstract class HomeViewModel extends State<HomeView> {
  AppStringConstants? appStringConstants = AppStringConstants.instance;

  Future<List<CharacterModel>>? characters;

  @override
  void initState() {
    characters = CharacterService().fetchCharacters();
    super.initState();
  }
}
