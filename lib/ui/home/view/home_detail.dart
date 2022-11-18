import 'package:flutter/material.dart';
import '../../../core/constants/extension/color_extension.dart';
import '../../../core/constants/extension/context_extension.dart';

import '../../../core/constants/extension/string_extension.dart';
import '../../../product/util/widget/custom_app_bar.dart';
import '../../../core/init/network/model/characters_model.dart';

class HomeDetailView extends StatefulWidget {
  final Character detailedCharacter;
  const HomeDetailView({Key? key, required this.detailedCharacter})
      : super(key: key);

  @override
  State<HomeDetailView> createState() => _HomeDetailViewState();
}

class _HomeDetailViewState extends State<HomeDetailView> {
  final AppStringConstants? _appStringConstants = AppStringConstants.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBarDetail(context),
      body: Column(
        children: [
          _charactersImage(context),
          Card(
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: context.padding2xVertical,
                  child: _characterTitle(context),
                ),
                Padding(
                  padding: context.padding2xBottom,
                  child: _statusButton(),
                ),
                Padding(
                    padding: context.paddingXVertical,
                    child: _genderText(context)),
                Padding(
                  padding: context.paddingXVertical,
                  child: _originText(context),
                ),
                Padding(
                  padding: context.paddingXVertical,
                  child: _locationText(context),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Text _locationText(BuildContext context) {
    return Text(
      'Location: ${widget.detailedCharacter.location.name} ',
      style: Theme.of(context).textTheme.headline6?.copyWith(
          fontWeight: FontWeight.bold, color: const Color(0xFF01b4c6)),
    );
  }

  Text _originText(BuildContext context) {
    return Text(
      'Origin: ${widget.detailedCharacter.origin.name}',
      style: Theme.of(context).textTheme.headline6?.copyWith(
          fontWeight: FontWeight.bold, color: const Color(0xFF01b4c6)),
    );
  }

  Text _genderText(BuildContext context) {
    return Text(
      'Gender: ${widget.detailedCharacter.gender}',
      style: Theme.of(context).textTheme.headline6?.copyWith(
          fontWeight: FontWeight.bold, color: const Color(0xFF01b4c6)),
    );
  }

  Center _statusButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(widget.detailedCharacter.status),
      ),
    );
  }

  Center _characterTitle(BuildContext context) {
    return Center(
      child: Text(
        widget.detailedCharacter.name,
        style: Theme.of(context).textTheme.headline5?.copyWith(
            fontWeight: FontWeight.bold, color: const Color(0xFF01b4c6)),
      ),
    );
  }

  Center _charactersImage(BuildContext context) {
    return Center(
      child: CircleAvatar(
          radius: context.hw70,
          backgroundImage: NetworkImage(widget.detailedCharacter.image)),
    );
  }

  CustomAppBar _customAppBarDetail(BuildContext context) {
    return CustomAppBar(
      title: _appStringConstants!.characterDetailTitle,
      icon: IconButton(
        icon: Icon(
          Icons.chevron_left_outlined,
          color: context.heatherGrey,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
    );
  }
}
