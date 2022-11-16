import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_app/core/constants/extension/context_extension.dart';
import 'package:flutter_rick_and_morty_app/product/util/widget/custom_list_tile.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.subTitle})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: context.paddingXLeft,
            child: _circleImage(context),
          ),
          Padding(
            padding: context.padding2xTop + context.paddingXLeft,
            child: _customListTitle(context),
          ),
        ],
      ),
    );
  }

  SizedBox _customListTitle(BuildContext context) {
    return SizedBox(
      width: context.hw200,
      height: context.hw100,
      child: CustomListTile(title: title, subTitle: subTitle),
    );
  }

  CircleAvatar _circleImage(BuildContext context) {
    return CircleAvatar(
        radius: context.hw50, backgroundImage: NetworkImage(imageUrl));
  }
}
