import 'package:flutter/material.dart';
import 'price_chip.dart';

class TotalBar extends StatelessWidget {
  const TotalBar({
    super.key,
    required this.lineCount,
    required this.total,
    required this.onSave,
  });

  final int lineCount;
  final int total;
  final VoidCallback onSave;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHigh,
        border: Border(
          top: BorderSide(
            color: colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lineCount == 0
                      ? 'Belum ada pesanan'
                      : '$lineCount menu dipilih',
                  style: const TextStyle(fontSize: 12),
                ),
                const SizedBox(height: 4),
                PriceChip(price: total),
              ],
            ),
          ),
          FilledButton(
            onPressed: total == 0 ? null : onSave,
            child: const Text('Simpan'),
          ),
        ],
      ),
    );
  }
}