import 'package:flutter/material.dart';
import 'package:frontend/screens/ai_search_result_screen.dart';
import 'package:frontend/widgets/aiSearchProgress.dart';

class AiSearching extends StatelessWidget {
  const AiSearching({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AiSearchProgress(
                progressText: "AI가 반려견을 찾는 중입니다.", selectNum: 3),
            const SizedBox(
              height: 30,
            ),
            Image.asset('assets/images/searchingPuppy.png'),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AiSearchResultScreen()));
                },
                child: const Text("다음으로(임시버튼)")),
          ],
        ),
      ),
    );
  }
}
