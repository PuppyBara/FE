import 'package:flutter/material.dart';

class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 200, // 높이 설정
        decoration: const BoxDecoration(
          color: Colors.yellow, // 배경 색상을 노란색으로 설정
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20), // 왼쪽 하단 곡선
            bottomRight: Radius.circular(20), // 오른쪽 하단 곡선
          ),
        ),
        child: const Column(
          children: <Widget>[
            // 컨텐츠 작성 부분
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                '프로필',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // 추가적인 위젯들...
          ],
        ),
      ),
    );
  }
}
