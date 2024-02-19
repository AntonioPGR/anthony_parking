import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/components/drawer/drawer_item.dart';
import 'package:anthony_parking/tools/page_navigator.dart';
import 'package:flutter/material.dart';

class NavDrawer extends StatelessWidget{
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ThemeColors.dark_brown,
      width: 500,
      child: ListView(
        padding: const EdgeInsets.only(top: 35),
        children: [
          DrawerItem(
            icon: Icons.menu_open,
            onTap: () => Scaffold.of(context).closeDrawer(),
          ),
          DrawerItem(
            icon: Icons.home,
            title: "Home",
            onTap: () => PageNavigator.goHome(context),
          ),
          DrawerItem(
            icon: Icons.car_rental,
            title: "Entrada",
            onTap: () => PageNavigator.goEntry(context),
          ),
          DrawerItem(
            icon: Icons.settings,
            title: "Configurações",
            onTap: () => PageNavigator.goConfigurations(context),
          )
        ],
      ),
    );
  }

}