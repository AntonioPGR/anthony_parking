import 'package:anthony_parking/components/spacer/custom_spacer.dart';
import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

class InputRow extends StatelessWidget{
  Widget first_input;
  Widget last_input;
  double gap_size;
  InputRow({
    required this.first_input,
    required this.last_input,
    this.gap_size = 16,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: first_input),
        Gap(gap_size),
        Expanded(child: last_input)
      ],
    );
  }
}