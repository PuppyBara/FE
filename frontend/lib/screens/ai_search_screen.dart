import 'package:flutter/material.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/widgets/image_slider.dart';

class AiSearchScreen extends StatelessWidget {
  const AiSearchScreen({super.key});

  static const TextStyle commonTextStyle = TextStyle(
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Flexible(
          flex: 3,
          child: Image.asset('assets/images/aiPuppy.png'),
        ),
        const Flexible(
          flex: 1,
          child: Text.rich(
            TextSpan(
              children: <TextSpan>[
                TextSpan(
                    text: 'AI',
                    style: TextStyle(
                        color: customGreen,
                        fontWeight: FontWeight.w700,
                        fontSize: 30)),
                TextSpan(
                    text: '로 반려견을 찾아보세요!',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 27,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 2,
          child: Text.rich(TextSpan(children: <TextSpan>[
            TextSpan(
              text: '전국 보호소',
              style: commonTextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: "강아지와",
              style: commonTextStyle.copyWith(),
            ),
            TextSpan(
              text: "임시 보호",
              style: commonTextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: "중인 강아지의",
              style: commonTextStyle.copyWith(),
            ),
            TextSpan(
              text: "비문",
              style: commonTextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: "과",
              style: commonTextStyle.copyWith(),
            ),
            TextSpan(
              text: "얼굴을",
              style: commonTextStyle.copyWith(fontWeight: FontWeight.w700),
            ),
            TextSpan(
              text: "비교 분석하여 가장 유사한 반려견을 찾아드립니다.",
              style: commonTextStyle.copyWith(),
            ),
          ])),
        )
      ],
    ));
  }
}
