import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:flutter/material.dart';

class DrawerItem extends StatefulWidget{

  final IconData icon;
  final String? title;
  final Function onTap;
  const DrawerItem({
    super.key,
    required this.icon,
    this.title = "",
    required this.onTap
  });

  @override
  createState() => _DrawerItemState();

}

class _DrawerItemState extends State<DrawerItem>{
  @override
  Widget build(BuildContext context) {
    return ListTile(
        contentPadding: const EdgeInsets.all(8),
        leading: Icon(
          widget.icon,
          color: ThemeColors.off_white,
          size: 60,
        ),
        title: widget.title != null? Text(
          widget.title!.toUpperCase(),
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            color: ThemeColors.off_white,
            fontSize: 40,
          ),
        ) : null,
        onTap: () => widget.onTap(),
    );
  }

}