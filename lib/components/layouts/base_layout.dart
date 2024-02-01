import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/components/drawer/nav_drawer.dart';
import 'package:anthony_parking/components/header/index.dart';
import 'package:flutter/material.dart';

class BaseLayout extends StatelessWidget{
  final Widget child;
  const BaseLayout({
    super.key,
    required this.child
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const Header(),
      drawer: const NavDrawer(),
      body: ColoredBox(
          color: ThemeColors.off_white,
          child:  Padding(
            padding: const EdgeInsets.all(16),
            child: child
          )
      ),
    );
  }
}