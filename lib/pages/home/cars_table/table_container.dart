import "package:anthony_parking/assets/themes/theme_colors.dart";
import "package:flutter/cupertino.dart";

class TableContainer extends StatelessWidget {
  final Widget table;
  const TableContainer({required this.table, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: ThemeColors.light_brown,
        child: RawScrollbar(
          thumbColor: ThemeColors.dark_brown,
          thickness: 5,
          radius: const Radius.circular(5),
          child: SingleChildScrollView(child: table),
        ),
      ),
    );
  }
}
