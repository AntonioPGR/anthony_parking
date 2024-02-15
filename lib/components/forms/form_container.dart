import 'package:anthony_parking/components/custom_widgets/custom_column.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormContainer extends StatelessWidget{
  final GlobalKey<FormBuilderState> form_key;
  final List<Widget> inputs;
  final double? gap_size;
  const FormContainer({
    required this.inputs,
    required this.form_key,
    this.gap_size,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: form_key,
      child: CustomColumn(
        gap_size: gap_size ?? 0,
        children: inputs,
      ),
    );
  }
}