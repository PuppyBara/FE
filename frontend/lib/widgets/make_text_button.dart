import 'package:flutter/material.dart';

class MakeTextButton extends StatelessWidget {
  final String text;
  final Color color;
  final double buttonWidth;
  final double buttonHeight;
  final VoidCallback onPressed;
  final double radius;
  final double fontSize;
  const MakeTextButton({
    super.key,
    required this.text,
    required this.color,
    required this.buttonWidth,
    required this.buttonHeight,
    required this.onPressed,
    required this.radius,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: color,
          fixedSize: Size(buttonWidth, buttonHeight),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(radius),
            ),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: fontSize),
        ));
  }
}
