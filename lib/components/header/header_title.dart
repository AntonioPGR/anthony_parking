import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:anthony_parking/assets/themes/theme_texts.dart';
import 'package:anthony_parking/data/settings/header_title.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HeaderTitle extends StatelessWidget {
  HeaderTitle({super.key});
  late StateHeaderTitle state_header_title;

  String getTitle(){
    return state_header_title.get(); 
  }

  @override
  Widget build(BuildContext context) {
    state_header_title = Provider.of<StateHeaderTitle>(context, listen: true);

    return Text(
      getTitle(),
      style: ThemeText.titleMedium(color: ThemeColors.off_white)
    );
  }
}
