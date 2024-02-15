import 'package:anthony_parking/components/header/clock.dart';
import 'package:anthony_parking/components/header/header_title.dart';
import 'package:flutter/material.dart';


class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.menu,
            size: 50,
          )
        ),
      ),
      title: HeaderTitle(),
      centerTitle: true,
      actions: [
        ClockWidget()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
