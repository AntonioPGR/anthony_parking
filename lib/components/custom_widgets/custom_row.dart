import "package:anthony_parking/tools/list_functions.dart";
import "package:flutter/cupertino.dart";
import "package:gap/gap.dart";

class CustomRow extends StatelessWidget {
  List<Widget> children;
  double gap_size;
  final MainAxisAlignment? main_alignment;
  final CrossAxisAlignment? cross_alignment;
  
  CustomRow({
    required this.children,
    this.gap_size = 0,
    super.key,
    this.main_alignment,
    this.cross_alignment
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: ListFunctions.insertBetweenElements(children, Gap(gap_size)),
    );
  }
}
