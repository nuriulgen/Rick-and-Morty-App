import 'package:flutter/material.dart';
import '../../../core/constants/extension/color_extension.dart';
import '../../../core/constants/extension/context_extension.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.title,
      required this.subTitle,
      required this.airDate})
      : super(key: key);

  final String title;
  final String subTitle;
  final String airDate;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: context.hw10,
      child: ListTile(
        title: _title(context),
        subtitle: Padding(
          padding: context.paddingX2Top,
          child: _subTitle(context),
        ),
        trailing: _trailing(context),
      ),
    );
  }

  Text _trailing(BuildContext context) {
    return Text(
        airDate,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(fontWeight: FontWeight.w400),
      );
  }

  Text _subTitle(BuildContext context) {
    return Text(
      subTitle,
      style: Theme.of(context)
          .textTheme
          .bodyMedium
          ?.copyWith(color: context.black, fontWeight: FontWeight.w300),
    );
  }

  Text _title(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontWeight: FontWeight.w400),
    );
  }
}
