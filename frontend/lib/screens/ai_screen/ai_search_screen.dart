import 'package:flutter/material.dart';
import 'package:frontend/screens/ai_screen/ai_search_select_screen.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/widgets/image_slider.dart';
import 'package:frontend/widgets/make_text_button.dart';

class AiSearchScreen extends StatelessWidget {
  const AiSearchScreen({super.key});

  static const TextStyle commonTextStyle = TextStyle(
    fontSize: 17,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/aiPuppy.png',
                width: MediaQuery.of(context).size.width * 0.8,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Column(
            children: [
              const Text.rich(
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
              Text.rich(TextSpan(children: <TextSpan>[
                TextSpan(
                  text: '전국 보호소 ',
                  style: commonTextStyle.copyWith(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text: "강아지와",
                  style: commonTextStyle.copyWith(),
                ),
              ])),
              Text.rich(TextSpan(children: <TextSpan>[
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
                  text: " 얼굴을",
                  style: commonTextStyle.copyWith(fontWeight: FontWeight.w700),
                ),
              ])),
              Text(
                "비교 분석하여 가장 유사한 반려견을",
                style: commonTextStyle.copyWith(),
              ),
              Text(
                "찾아드립니다.",
                style: commonTextStyle.copyWith(),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          MakeTextButton(
            buttonHeight: 52,
            buttonWidth: 198,
            text: "AI로 검색하기",
            color: customOrange,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AiSearchSelectScreen()));
            },
            radius: 12,
            fontSize: 22,
            fontWeight: FontWeight.w600,
          )
        ],
      ),
    ));
  }
}
