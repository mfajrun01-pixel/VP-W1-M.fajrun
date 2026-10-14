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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.sports_esports_outlined,
              size: 64,
              color: colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              query.isEmpty
                  ? 'Belum ada game di backlog'
                  : 'Game "$query" tidak ditemukan',
              maxLines: 2 ,
              overflow: TextOverflow.ellipsis,
              style: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'Coba tambahkan game baru atau ubah kata kunci pencarian Anda.',
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton.tonal(
              onPressed: onResetSearch,
              child: const Text('Reset Pencarian'),
            ),
          ],
        ),
      ),
    );
  }
}
