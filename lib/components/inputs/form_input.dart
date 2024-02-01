import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormInput extends StatelessWidget{
  final TextEditingController controller;
  final String label_text;

  final String? hint_text;
  final TextInputType? keyboard_type;
  final String? Function(String?)? validator;
  final bool? required;
  final bool? read_only;
  final List<TextInputFormatter>? formatters;
  final bool? capitalize;
  final void Function(String?)? onChange;

  const FormInput({
    super.key,
    required this.controller,
    required this.label_text,
    this.hint_text = "",
    this.required,
    this.validator,
    this.read_only,
    this.keyboard_type,
    this.formatters,
    this.capitalize,
    this.onChange,
  });

  @override
  Widget build(BuildContext context){
    InputDecoration decoration = const InputDecoration().applyDefaults(
        Theme.of(context).inputDecorationTheme
    );
    return FormBuilderTextField(
      name: label_text,
      decoration: decoration.copyWith(
        label: Text(required == true? "$label_text *" : label_text),
        hintText: hint_text,
        labelStyle: read_only == true? Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(
          color: ThemeColors.gray
        ) : null,
        floatingLabelStyle: read_only == true? Theme.of(context).inputDecorationTheme.labelStyle?.copyWith(
          color: ThemeColors.gray
        ) : null,
      ),
      keyboardType: keyboard_type,
      readOnly: read_only ?? false,
      validator: validator,
      style: const TextStyle(
          fontSize: 30
      ),
      controller: controller,
      inputFormatters: formatters,
      textCapitalization: capitalize == true? TextCapitalization.characters : TextCapitalization.none,
      enabled: read_only == true? false : true,
      onChanged: onChange,
    );
  }
}