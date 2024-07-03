import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class Logo extends StatelessWidget {
  Logo({
    super.key,
    required this.title,
  });

  final String title;
  final Shader gradientColor = ui.Gradient.linear(
    const Offset(0, 0), // 좌상단 시작점
    const Offset(300, 0), // 우하단 끝점
    [
      const Color.fromRGBO(132, 205, 188, 1),
      const Color.fromRGBO(207, 219, 169, 1),
      const Color.fromRGBO(255, 204, 128, 1),
    ],
    [0.0, 0.8, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            const SizedBox(height: 100),
            Image.asset(
              'assets/images/splash.png',
              width: 134,
              fit: BoxFit.contain,
            ),
            Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 35,
                foreground: Paint()..shader = gradientColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
