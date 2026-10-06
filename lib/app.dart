import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/menu/presentation/game_screen.dart';

class GameH1 extends StatelessWidget {
  const GameH1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameVault',
      theme: AppTheme.lightTheme,
      home: const GameScreen(),
    );
  }
}
