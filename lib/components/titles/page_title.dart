import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class PageTitle extends StatefulWidget{
  final String title;
  const PageTitle(this.title, {super.key});

  @override
  State<PageTitle> createState() => _PageTitle();
}

class _PageTitle extends State<PageTitle>{
  @override
  Widget build(BuildContext context){
    return Text(
      widget.title,
      style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 40,
          color: ThemeColors.dark_brown
      )
    );
  }
}