import 'package:flutter/material.dart';
import 'package:frontend/screens/search_pw_screen.dart';
import 'package:frontend/widgets/input_form.dart';
import 'package:frontend/widgets/logo.dart';
import 'package:frontend/widgets/make_text_button.dart';

class LoginScreen extends StatelessWidget {
  final String userType;
  final Color inputColor = const Color.fromRGBO(196, 196, 196, 0.2);
  final Color inputTextColor = const Color.fromRGBO(0, 0, 0, 0.5);
  final Color whiteGrey = const Color.fromRGBO(158, 158, 158, 1);
  final Color personButtonColor = const Color.fromRGBO(132, 205, 188, 1);

  final TextEditingController idController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key, required this.userType});

  @override
  Widget build(BuildContext context) {
    final double buttonWidth = MediaQuery.of(context).size.width * 0.85;

    return Scaffold(
        body: Column(
      children: [
        Logo(title: "Sign In"),
        const SizedBox(
          height: 80,
        ),
        InputForm(
          inputText: "아이디를 입력해주세요.",
          suffixIcon:
              Icon(Icons.person_2_outlined, size: 24, color: inputTextColor),
          controller: idController,
        ),
        const SizedBox(
          height: 20,
        ),
        InputForm(
          inputText: "비밀번호를 입력해주세요.",
          suffixIcon: Icon(
            Icons.lock_outline,
            size: 24,
            color: inputTextColor,
          ),
          controller: passwordController,
        ),
        const SizedBox(
          height: 20,
        ),
        const SizedBox(
          height: 20,
        ),
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
              onPressed: () {
                final String id = idController.text.toString();
                final String password = passwordController.text.toString();

                try {
                  
                } catch (e) {
                  
                }
              },
            )
          ],
        ),
        const SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "비밀번호를 잊으셨나요?  >> ",
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
                )),
          ],
        ),
      ],
    ));
  }
}
