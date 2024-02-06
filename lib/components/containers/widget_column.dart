import 'package:anthony_parking/components/spacer/custom_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class WidgetRow extends StatelessWidget{
  List<Widget> widgets;
  double gap_size;
  WidgetRow({
    required this.widgets,
    this.gap_size = 16,
    super.key
  });

  List<Widget> getWidgetsWithGap(){
    List<Widget> new_list = [];
    for(int i = 0; i < widgets.length; i++){
      if(i !=0) {
        new_list.add(Gap(gap_size));
      }
      new_list.add(
        Expanded(child: widgets[i])
      );
    }
    return new_list;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: getWidgetsWithGap(),
    );
  }
}