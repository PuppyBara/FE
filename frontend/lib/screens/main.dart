import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

// Future main() async {
//   WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
//   FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
//   await initialization();

//   runApp(const App());
// }

void main() async {
  runApp(const App());
}

// initialization() async {
//   await Future.delayed(const Duration(seconds: 2));
//   FlutterNativeSplash.remove();
// }

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  // This widget is the root of your Application.
  @override
  Widget build(BuildContext context) {
    // FlutterNativeSplash.remove();
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: const HomeScreen(),
    );
  }
}
