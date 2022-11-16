import 'package:flutter/material.dart';
import 'package:flutter_rick_and_morty_app/core/constants/extension/context_extension.dart';
import 'package:flutter_rick_and_morty_app/core/constants/extension/string_extension.dart';
import 'package:flutter_rick_and_morty_app/product/util/widget/custom_app_bar.dart';
import 'package:flutter_rick_and_morty_app/product/util/widget/custom_card.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final AppStringConstants? _appStringConstants = AppStringConstants.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _appStringConstants!.characterTitle),
      body: Padding(
          padding: context.paddingXHorizontal + context.paddingXTop,
          child: Column(
            children: [
              SizedBox(
                height: context.hw150,
                width: MediaQuery.of(context).size.width,
                child: const CustomCard(
                  imageUrl:
                      'https://i.scdn.co/image/ab6761610000e5ebd624c3bdcf79aeac5190479d',
                  title: 'ldsjmvns',
                  subTitle: 'şvmdsvk dösd dxöddsö',
                ),
              ),
              SizedBox(
                height: context.hw150,
                width: MediaQuery.of(context).size.width,
                child: const CustomCard(
                  imageUrl:
                      'https://i.scdn.co/image/ab6761610000e5ebd624c3bdcf79aeac5190479d',
                  title: 'ldsjmvns',
                  subTitle: 'şvmdsvk dösd dxöddsö',
                ),
              ),
            ],
          )),
    );
  }
}
