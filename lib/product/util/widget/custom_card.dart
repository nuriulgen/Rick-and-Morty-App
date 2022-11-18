import 'package:flutter/material.dart';

import '../../../core/constants/extension/color_extension.dart';
import '../../../core/constants/extension/context_extension.dart';
import '../../../core/constants/extension/string_extension.dart';
import '../../../core/constants/image/custom_network_image.dart';

class CustomCard extends StatelessWidget {
  const CustomCard(
      {Key? key,
      required this.imageUrl,
      required this.title,
      required this.lastLocation,
      required this.status,
      this.onTap})
      : super(key: key);

  final String imageUrl;
  final String title;
  final String lastLocation;
  final String status;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    AppStringConstants? appStringConstants = AppStringConstants.instance;
    return Padding(
      padding: context.paddingXBottom,
      child: InkWell(
        onTap: onTap,
        child: _customCard(context, appStringConstants),
      ),
    );
  }

  Card _customCard(BuildContext context, AppStringConstants? appStringConstants) {
    return Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                _charactersImage(context),
                StatusText(status: status),
              ],
            ),
            Padding(
              padding: context.paddingX2Top + context.paddingX2Left,
              child: _charactersTitle(context),
            ),
            Padding(
              padding: context.paddingX2Top + context.paddingX2Left,
              child: _lastLocationTitle(appStringConstants, context),
            ),
            Padding(
              padding: context.paddingX2Left,
              child: _lastLocationSubTitle(context),
            ),
          ],
        ),
      );
  }

  SizedBox _charactersImage(BuildContext context) {
    return SizedBox(
      height: context.hw200,
      width: MediaQuery.of(context).size.width,
      child: CustomNetworkImage(imagePath: imageUrl),
    );
  }

  Text _lastLocationSubTitle(BuildContext context) {
    return Text(
      lastLocation,
      style: Theme.of(context)
          .textTheme
          .bodySmall
          ?.copyWith(color: context.black, fontWeight: FontWeight.w400),
    );
  }

  SizedBox _lastLocationTitle(
      AppStringConstants? appStringConstants, BuildContext context) {
    return SizedBox(
      width: context.hw150,
      child: Text(
        appStringConstants!.lastLocationText,
        style: Theme.of(context)
            .textTheme
            .bodyMedium
            ?.copyWith(color: context.black, fontWeight: FontWeight.w300),
      ),
    );
  }

  Text _charactersTitle(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(color: context.black, fontWeight: FontWeight.bold),
    );
  }
}

class StatusText extends StatelessWidget {
  const StatusText({
    Key? key,
    required this.status,
  }) : super(key: key);

  final String status;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: context.hw5,
      right: context.hw5,
      child: SizedBox(
        height: context.hw25,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: context.green),
          onPressed: () {},
          child: Text(status),
        ),
      ),
    );
  }
}
