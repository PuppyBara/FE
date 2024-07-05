import 'package:flutter/material.dart';

class MakeTextList extends StatelessWidget {
  const MakeTextList({
    super.key,
    required this.title,
    required this.textIcon,
  });

  final String title;
  final IconData textIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Icon(
          textIcon,
          size: 13,
        ),
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Color.fromRGBO(58, 58, 58, 1)),
        ),
      ],
    );
  }
}
