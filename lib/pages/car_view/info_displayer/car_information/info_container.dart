import 'package:anthony_parking/assets/themes/theme_colors.dart';
import 'package:flutter/cupertino.dart';

class InfoContainer extends StatelessWidget{
  String text;
  String label;
  InfoContainer({
    required this.text,
    required this.label,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: ThemeColors.beige,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                color: ThemeColors.black,
                fontWeight: FontWeight.w600
              ),
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 24,
                color: ThemeColors.dark_brown,
                fontWeight: FontWeight.w600
              ),
            ),
          ],
        ),
      )
    );
  }
}