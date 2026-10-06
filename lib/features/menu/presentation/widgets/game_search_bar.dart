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
      child: SearchBar(
        controller: controller,
        hintText: 'Cari judul game...',
        leading: const Icon(Icons.search),
        trailing: query.isEmpty
            ? null
            : [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: onClear,
                ),
              ],
        onChanged: onChanged,
        elevation: const WidgetStatePropertyAll(1.0),
      ),
    );
  }
}
