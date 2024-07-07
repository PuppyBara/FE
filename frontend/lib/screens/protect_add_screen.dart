import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProtectAddScreen extends StatelessWidget {
  const ProtectAddScreen({super.key});
  final Color customGrey = const Color.fromRGBO(217, 217, 217, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("보호정보 등록"),
          const Divider(
            height: 1,
          ),
          const Row(
            children: [
              Icon(Icons.info_outline),
              Text("비문 분석을 위해 꼭 정면사진을 등록해주세요")
            ],
          ),
          Center(
            child: Container(
              width: 100, // 컨테이너의 너비 설정
              height: 100, // 컨테이너의 높이 설정
              decoration: BoxDecoration(
                color: Colors.grey[350], // 회색 배경 색상
                borderRadius: BorderRadius.circular(10), // 모서리 둥글게 처리
              ),
              child: IconButton(
                icon: const Icon(Icons.add), // '+' 아이콘 추가
                iconSize: 24, // 아이콘 크기 설정
                color: Colors.black, // 아이콘 색상 설정
                onPressed: () {
                  // 버튼 클릭시 수행할 액션 작성
                  print('Add button pressed');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
