import 'package:flutter/cupertino.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

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

  Gap? getGap(){
    if(gap_size == null){
      return null;
    }
    return Gap(gap_size!);
  }

  List<Widget> renderInputs(){
    Gap? default_gap = getGap();
    List<Widget> new_list = [];
    for(int c = 0; c < inputs.length; c++){
      if(c==0){
        new_list.add(inputs.first);
      } else {
        gap_size != null? new_list.add(default_gap as Widget) : null;
        new_list.add(inputs[c]);
      }
    }
    return new_list;
  }

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: form_key,
      child: Column(
        children: renderInputs(),
      ),
    );
  }
}