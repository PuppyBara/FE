import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/models/ai_result/ai_result_list_model.dart';
import 'package:frontend/screens/ai_screen/ai_search_result_screen.dart';
import 'package:frontend/services/ai_search_api_service.dart';
import 'package:frontend/widgets/aiSearchProgress.dart';
import 'package:lottie/lottie.dart';

class AiSearching extends StatefulWidget {
  const AiSearching({super.key, required this.dogId, required this.upperBound});

  final int dogId;
  final int upperBound;

  @override
  State<AiSearching> createState() => _AiSearchingState();
}

class _AiSearchingState extends State<AiSearching> {
  late Future<AiResultListModel> resultDogs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    resultDogs = AiSearchApiService.getAiSearchResult(
        widget.dogId.toString(), widget.upperBound);
  }

  @override
  Widget build(BuildContext context) {
    print("내가 선택한 애들${widget.dogId}와 ${widget.upperBound}");
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<AiResultListModel>(
            future: resultDogs,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Column(
                  children: [
                    const AiSearchProgress(
                        progressText: "AI가 반려견을 찾는 중입니다.", selectNum: 3),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset('assets/images/runPuppy.gif'),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AiSearchResultScreen(
                                      resultDogs: snapshot.data!)));
                        },
                        child: const Text("다음으로(임시버튼)")),
                  ],
                );
              } else if (snapshot.hasError) {
                return const Text("AI 분석 API 호출 실패");
              } else {
                Future.microtask(() => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            AiSearchResultScreen(resultDogs: snapshot.data!))));
              }
              return Container();
            }),
      ),
    );
  }
}
