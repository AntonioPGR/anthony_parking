import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class TwoSidesLayout extends StatelessWidget{
  final Widget left_child;
  final Widget right_child;
  const TwoSidesLayout({
    super.key,
    required this.left_child,
    required this.right_child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        left_child,
        const Gap(48),
        right_child
      ]
    );
  }
}