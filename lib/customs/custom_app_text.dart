import 'package:flutter/material.dart';

class CustomAppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final bool? textCenter;
  final TextOverflow? overflow;
  const CustomAppText({
    super.key,
    required this.text,
    this.style,
    this.fontSize,
    this.color,
    this.fontWeight,
    this.textCenter,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textCenter == true ? TextAlign.center : null,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
      // ??
      //     GoogleFonts.sofiaSans(
      //       fontSize: fontSize,
      //       color: color,
      //       fontWeight: fontWeight,
      //     ),
      overflow: overflow,
    );
  }
}
