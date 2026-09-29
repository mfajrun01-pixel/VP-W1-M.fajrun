import 'package:flutter/material.dart';

class GameSearchBar extends StatelessWidget {
  const GameSearchBar({
    super.key,
    required this.controller,
    required this.query,
    required this.onChanged,
    required this.onClear,
  });

  final TextEditingController controller;
  final String query;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: 'Cari judul game...',
          prefixIcon: const Icon(Icons.search),
          suffixIcon: query.isEmpty
              ? null
              : IconButton(
            icon: const Icon(Icons.clear),
            onPressed: onClear,
          ),
          border: const OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }
}