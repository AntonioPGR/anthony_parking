import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

MaskTextInputFormatter PlateFormatter = MaskTextInputFormatter(
  mask: '###-@&@@',
  filter: {
    "#": RegExp(r'[A-Z]'),
    "@": RegExp(r'\d'),
    "&": RegExp(r'[0-9A-Z]')
  },
  type: MaskAutoCompletionType.lazy
);