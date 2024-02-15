import 'package:anthony_parking/tools/list_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class CustomColumn extends StatelessWidget {
  final List<Widget> children;
  final double gap_size;
  final MainAxisAlignment? main_alignment;
  final CrossAxisAlignment? cross_alignment;
  
  const CustomColumn({
    required this.children, 
    this.gap_size = 0, 
    this.main_alignment, 
    this.cross_alignment,
    super.key, 
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: main_alignment ?? MainAxisAlignment.center,
      crossAxisAlignment: cross_alignment ?? CrossAxisAlignment.center,
      children: ListFunctions.insertBetweenElements(children, Gap(gap_size)),
    );
  }
}
