import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/extension/color_extension.dart';
import '../../../core/init/theme/theme_notifier.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String title;
  final IconButton? icon;
  final void Function()? onPressed;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class _CustomAppBarState extends State<CustomAppBar>
    with TickerProviderStateMixin {
  bool isLight = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _backButton(),
      title: _title(context),
      centerTitle: true,
      actions: [
        _changeThemeButton(context),
      ],
    );
  }

  IconButton _changeThemeButton(BuildContext context) {
    // It changes the theme when the button is pressed.
    return IconButton(
      icon: const Icon(Icons.dark_mode),
      onPressed: () {
        isLight = !isLight;
        context.read<ThemeNotifier>().changeTheme();
      },
    );
  }

  Text _title(BuildContext context) {
    return Text(
      widget.title,
      style: Theme.of(context)
          .textTheme
          .headline6
          ?.copyWith(fontWeight: FontWeight.w400, color: context.white),
    );
  }

  IconButton _backButton() {
    return IconButton(
      // This method was created to return to the previous page.
        onPressed: widget.onPressed,
        icon: widget.icon ?? const SizedBox.shrink());
  }
}
