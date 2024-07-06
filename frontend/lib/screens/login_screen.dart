import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:frontend/screens/search_pw_screen.dart';
import 'package:frontend/widgets/input_form.dart';
import 'package:frontend/widgets/logo.dart';
import 'package:frontend/widgets/make_text_button.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  final String userType;

  const LoginScreen({super.key, required this.userType});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color inputTextColor = const Color.fromRGBO(0, 0, 0, 0.5);
  final Color whiteGrey = const Color.fromRGBO(158, 158, 158, 1);
  final Color personButtonColor = const Color.fromRGBO(132, 205, 188, 1);

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isExistMember = true;

  void login() async {
    final String id = idController.text.toString();
    final String password = passwordController.text.toString();

    final url = Uri.parse(
        'http://43.200.141.126/api/member/sign-in'); // 실제 API URL로 변경하세요
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'id': id,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      print('Login successful: $responseData');
    } else {
      print('Login failed: ${response.body}');
      setState(() {
        isExistMember = false;
      });

      // 일정 시간 후에 다시 상태 초기화
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          isExistMember = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.85;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Logo(title: "Sign In"),
              const SizedBox(height: 80),
              InputForm(
                inputText: "아이디를 입력해주세요.",
                suffixIcon:
                    Icon(Icons.person_outline, size: 30, color: inputTextColor),
                controller: idController,
              ),
              const SizedBox(height: 20),
              InputForm(
                inputText: "비밀번호를 입력해주세요.",
                suffixIcon:
                    Icon(Icons.lock_outline, size: 30, color: inputTextColor),
                controller: passwordController,
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  MakeTextButton(
                      text: "로그인",
                      color: personButtonColor,
                      buttonWidth: buttonWidth,
                      buttonHeight: 44,
                      radius: 10,
                      fontSize: 20,
                      onPressed: login,
                      fontWeight: FontWeight.w700)
                ],
              ),
              const SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "비밀번호를 잊으셨나요? >> ",
                    style: TextStyle(
                      color: whiteGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SearchPwScreen(),
                      ),
                    ),
                    child: Text(
                      "비밀번호 찾기",
                      style: TextStyle(
                        color: whiteGrey,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: whiteGrey,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (!isExistMember)
            Positioned(
              bottom: 60, // 맨 아래에 위치하도록 설정
              left: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.75),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: const Text(
                  "존재하지 않는 회원입니다.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
