import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CommonAppBar(
      {super.key, required this.title, required this.showLeading});

  final String title;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(fontSize: 30),
      ),
      leading: showLeading ? const Icon(Icons.arrow_back) : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
