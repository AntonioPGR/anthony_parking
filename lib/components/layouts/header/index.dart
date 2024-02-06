import 'package:anthony_parking/components/layouts/header/clock.dart';
import 'package:anthony_parking/components/layouts/header/header_title.dart';
import 'package:flutter/material.dart';


class Header extends StatelessWidget implements PreferredSizeWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leadingWidth: 80,
      leading: Builder(
        builder: (context) => IconButton(
          onPressed: () => Scaffold.of(context).openDrawer(),
          icon: const Icon(
            Icons.menu,
            size: 50,
          )
        ),
      ),
      title: const HeaderTitle(),
      actions: const [
        ClockWidget()
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(120);
}
