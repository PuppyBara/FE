import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class AiSearchProgress extends StatelessWidget {
  const AiSearchProgress({
    super.key,
    required this.progressText,
    required this.selectNum,
  });

  final String progressText;
  final int selectNum;

  @override
  Widget build(BuildContext context) {
    const Color customGreen = Color.fromRGBO(132, 205, 188, 1);
    const Color customOrange = Color.fromRGBO(255, 204, 128, 1);

    bool shouldHighlight =
        progressText.contains('총') && progressText.contains('건이');

    return Column(
      children: [
        const SizedBox(
          height: 120,
        ),
        const Center(
          child: Text(
            "Findog AI 검색",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 30,
            ),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 17,
              child: StepProgressIndicator(
                totalSteps: 1,
                currentStep: 1,
                selectedColor: selectNum == 1 ? customOrange : customGreen,
                size: 6,
                roundedEdges: const Radius.circular(17),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 17,
              child: StepProgressIndicator(
                totalSteps: 1,
                currentStep: 1,
                selectedColor: selectNum == 2 ? customOrange : customGreen,
                size: 6,
                roundedEdges: const Radius.circular(17),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 17,
              child: StepProgressIndicator(
                totalSteps: 1,
                currentStep: 1,
                selectedColor: selectNum == 3 ? customOrange : customGreen,
                size: 6,
                roundedEdges: const Radius.circular(17),
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 17,
              child: StepProgressIndicator(
                totalSteps: 1,
                currentStep: 1,
                selectedColor: selectNum == 4 ? customOrange : customGreen,
                size: 6,
                roundedEdges: const Radius.circular(17),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 70,
        ),
        Text.rich(
          TextSpan(
            text: progressText.substring(0, progressText.indexOf('총') + 1),
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
            ),
            children: [
              TextSpan(
                text: progressText.substring(progressText.indexOf('총') + 1,
                    progressText.indexOf('건') + 1),
                style: shouldHighlight
                    ? const TextStyle(
                        color: customOrange, fontWeight: FontWeight.w700)
                    : null,
              ),
              TextSpan(
                text: progressText.substring(progressText.indexOf('건') + 1),
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
