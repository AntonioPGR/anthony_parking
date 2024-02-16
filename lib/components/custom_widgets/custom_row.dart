import "package:anthony_parking/tools/list_functions.dart";
import "package:flutter/cupertino.dart";
import "package:gap/gap.dart";

class CustomRow extends StatelessWidget {
  final List<Widget> children;
  final double gap_size;
  final bool extended_child;
  final MainAxisAlignment main_alignment;
  final CrossAxisAlignment cross_alignment;
  
  const CustomRow({
    required this.children,
    this.extended_child = false,
    this.gap_size = 0,
    this.main_alignment = MainAxisAlignment.spaceBetween,
    this.cross_alignment = CrossAxisAlignment.center,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: main_alignment,
      crossAxisAlignment: cross_alignment,
      children: WidgetsListFunctions.insertBetween(children, Gap(gap_size)),
    );
  }
}
