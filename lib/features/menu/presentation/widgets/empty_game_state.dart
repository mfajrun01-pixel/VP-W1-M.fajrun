import 'package:flutter/material.dart';

class EmptyGameState extends StatelessWidget {
  const EmptyGameState({
    super.key,
    required this.query,
    required this.onResetSearch,
  });

  final String query;
  final VoidCallback onResetSearch;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.sports_esports_outlined, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            Text(
              query.isEmpty ? 'Belum ada game di backlog' : 'Game "$query" tidak ditemukan',
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              'Coba tambahkan game baru atau ubah kata kunci pencarian Anda.',
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onResetSearch,
              child: const Text('Reset Pencarian'),
            ),
          ],
        ),
      ),
    );
  }
}