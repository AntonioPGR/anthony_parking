import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class WidgetColumn extends StatelessWidget{
  final List<Widget> widgets;
  final double gap_size;
  WidgetColumn({
    required this.widgets,
    this.gap_size = 16,
    super.key
  });

  List<Widget> getWidgetsWithGap(){
    List<Widget> new_list = [];
    for(int i = 0; i < widgets.length; i++){
      if(i != 0) {
        new_list.add(Gap(gap_size));
      }
      new_list.add(widgets[i]);
    }
    return new_list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: getWidgetsWithGap(),
    );
  }
}