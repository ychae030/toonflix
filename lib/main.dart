import 'package:flutter/material.dart';
import 'package:toonflix/screen/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key}); // 위젯 식별 key

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
