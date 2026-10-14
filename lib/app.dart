import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/menu/presentation/game_screen.dart';

class GameH1 extends StatefulWidget {
  const GameH1({super.key});

  @override
  State<GameH1> createState() => _GameH1State();
}

class _GameH1State extends State<GameH1> {
  ThemeMode _themeMode = ThemeMode.system;

  void _setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GameVault',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: GameScreen(
        themeMode: _themeMode,
        onThemeModeChanged: _setThemeMode,
      ),
    );
  }
}
