import 'package:flutter/material.dart';
import 'package:frontend/widgets/logo.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/signup_screen.dart';
import 'package:frontend/widgets/make_text_button.dart';

void main() {
  runApp(const LoginMainScreen());
}

class LoginMainScreen extends StatelessWidget {
  const LoginMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginMain(),
    );
  }
}

class LoginMain extends StatelessWidget {
  const LoginMain({super.key});
  final Color personButtonColor = const Color.fromRGBO(132, 205, 188, 1);
  final Color companyButtonColor = const Color.fromRGBO(255, 204, 128, 1);
  final Color whiteGrey = const Color.fromRGBO(158, 158, 158, 1);

  @override
  Widget build(BuildContext context) {
    // 그라데이션 색상 정의

    final double buttonWidth = MediaQuery.of(context).size.width * 0.85;

    return Scaffold(
      body: Column(
        children: [
          Logo(title: "Findog"),
          const SizedBox(
            height: 50,
          ),
          Column(
            children: [
              MakeTextButton(
                text: "일반회원 로그인",
                color: personButtonColor,
                buttonWidth: buttonWidth,
                buttonHeight: 96.0,
                radius: 12,
                fontSize: 25,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(userType: '일반회원'),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 30,
              ),
              MakeTextButton(
                text: "기업회원 로그인",
                color: companyButtonColor,
                buttonWidth: buttonWidth,
                buttonHeight: 96.0,
                radius: 12,
                fontSize: 25,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(userType: '기업회원'),
                    ),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "계정이 없으신가요?  >> ",
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
                              builder: (context) => const SignupScreen(),
                            ),
                          ),
                      child: Text(
                        "회원가입",
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
          )
        ],
      ),
    );
  }
}
