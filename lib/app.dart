import 'package:flutter/material.dart';
import 'features/menu/presentation/game_screen.dart';

class GameH1 extends StatelessWidget {
  const GameH1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF00696E),
      ),
      home: const GameScreen(),
    );
  }
}