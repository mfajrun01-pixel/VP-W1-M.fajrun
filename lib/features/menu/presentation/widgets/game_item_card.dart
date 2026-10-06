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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          backgroundColor: colorScheme.primaryContainer,
          child: Icon(
            Icons.videogame_asset,
            color: colorScheme.onPrimaryContainer,
          ),
        ),
        title: Text(
          game['title'],
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 6.0),
          child: Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: [
              Chip(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                label: Text(
                  game['platform'],
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
                backgroundColor: colorScheme.secondaryContainer,
                side: BorderSide.none,
              ),
              Chip(
                visualDensity: VisualDensity.compact,
                padding: EdgeInsets.zero,
                label: Text(
                  game['status'],
                  style: textTheme.labelSmall?.copyWith(
                    color: colorScheme.onTertiaryContainer,
                  ),
                ),
                backgroundColor: colorScheme.tertiaryContainer,
                side: BorderSide.none,
              ),
            ],
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: colorScheme.outline,
        ),
        onTap: onTap,
      ),
    );
  }
}
