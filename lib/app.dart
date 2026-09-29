import 'package:flutter/material.dart';
import 'features/menu/presentation/menu_screen.dart';

class Lab02App extends StatelessWidget {
  const Lab02App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warung Digital',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFF00696E),
      ),
      home: const MenuScreen(),
    );
  }
}