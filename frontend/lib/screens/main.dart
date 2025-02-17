import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/login_screen/login_main_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:frontend/screens/home_screen.dart';

const Color customGreen = Color.fromRGBO(132, 205, 188, 1);
const Color customOrange = Color.fromRGBO(255, 204, 128, 1);

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initialization();

  runApp(const App());
}

Future<void> initialization() async {
  await Future.delayed(const Duration(seconds: 2));
  FlutterNativeSplash.remove();
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const LoginMainScreen(),
    );
  }
}
