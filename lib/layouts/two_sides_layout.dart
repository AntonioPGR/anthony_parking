import "package:flutter/cupertino.dart";
import "package:gap/gap.dart";

class TwoSidesLayout extends StatelessWidget {
  final Widget left_child;
  final Widget right_child;
  final double gap_size;
  const TwoSidesLayout({
    super.key,
    required this.left_child,
    required this.right_child,
    this.gap_size = 48,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          left_child, 
          Gap(gap_size), 
          right_child
        ]
      )
    );
  }
}
