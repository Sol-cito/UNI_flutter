import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar(
      {super.key, required this.title, required this.showLeading});

  final String title;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 100,
      elevation: 0.0,
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 25),
      ),
      leading: showLeading ? const Icon(Icons.arrow_back) : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
