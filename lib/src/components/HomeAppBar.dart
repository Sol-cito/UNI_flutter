import 'package:flutter/material.dart';
import 'package:uni_flutter/src/components/SearchField.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appImageDir = "assets/un_flag.png";

  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Image.asset(appImageDir),
      title: const SearchField(),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
