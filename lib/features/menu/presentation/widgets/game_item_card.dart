import 'package:flutter/material.dart';

class GameItemCard extends StatelessWidget {
  const GameItemCard({
    super.key,
    required this.game,
    required this.onTap,
  });

  final Map<String, dynamic> game;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: const CircleAvatar(
          child: Icon(Icons.videogame_asset),
        ),
        title: Text(
          game['title'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text('Platform: ${game['platform']} | Status: ${game['status']}'),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: onTap,
      ),
    );
  }
}