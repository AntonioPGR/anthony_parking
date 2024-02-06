import 'package:anthony_parking/components/forms/buttons/Button.dart';
import 'package:anthony_parking/components/titles/page_title.dart';
import 'package:flutter/cupertino.dart';

class DefaultFormLayout extends StatelessWidget{
  final String title;
  final Widget form_content;
  final String button_label;
  final void Function() onSubmit;
  const DefaultFormLayout({
    super.key,
    required this.title,
    required this.form_content,
    required this.button_label,
    required this.onSubmit
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PageTitle(title),
          form_content,
          Button(
            label: button_label,
            on_press: onSubmit
          )
        ]
      )
    );
  }
}