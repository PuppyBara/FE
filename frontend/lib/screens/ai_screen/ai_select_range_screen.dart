import 'package:flutter/material.dart';
import 'package:frontend/screens/ai_screen/ai_searching_screen.dart';
import 'package:frontend/screens/main.dart';
import 'package:frontend/widgets/aiSearchProgress.dart';

class AiSearchSelectRange extends StatefulWidget {
  const AiSearchSelectRange({super.key});

  @override
  State<AiSearchSelectRange> createState() => _AiSearchSelectRangeState();
}

class _AiSearchSelectRangeState extends State<AiSearchSelectRange> {
  double currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const AiSearchProgress(
            progressText: "결과 범위를 선택해주세요.",
            selectNum: 2,
          ),
          const SizedBox(
            height: 60,
          ),
          SliderTheme(
            data: const SliderThemeData(
              tickMarkShape: RoundSliderTickMarkShape(tickMarkRadius: 5.0),
              activeTickMarkColor: customGreen,
              inactiveTickMarkColor: Color.fromRGBO(217, 217, 217, 1),
              activeTrackColor: customGreen,
              inactiveTrackColor: Color.fromRGBO(232, 232, 232, 1),
              valueIndicatorColor: customGreen,
            ),
            child: Slider(
                value: currentSliderValue,
                min: 0,
                max: 100,
                thumbColor: customGreen,
                label: '${(100 - currentSliderValue).round()}%',
                divisions: 10,
                onChanged: (double value) {
                  setState(() {
                    currentSliderValue = value;
                  });
                }),
          ),
          const SizedBox(
            height: 80,
          ),
          Text.rich(TextSpan(children: <TextSpan>[
            const TextSpan(
                text: '일치율이 ',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
            TextSpan(
              text: '${(100 - currentSliderValue).round()}% ',
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 27,
                color: customOrange,
              ),
            ),
            const TextSpan(
                text: '이상인',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25)),
          ])),
          const Text.rich(TextSpan(
              text: '분석결과만 조회합니다.',
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25))),
          const SizedBox(
            height: 70,
          ),
          GestureDetector(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AiSearching())),
            child: const Text(
              "다음으로 >> ",
              style: TextStyle(
                color: Color.fromRGBO(83, 83, 83, 1),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
