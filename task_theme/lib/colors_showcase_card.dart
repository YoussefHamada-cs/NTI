import 'package:flutter/material.dart';

class ColorsShowcaseCard extends StatelessWidget {
  const ColorsShowcaseCard({super.key});

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    final colors = [
      ('Primary', cs.primary, cs.onPrimary),
      ('Secondary', cs.secondary, cs.onSecondary),
      ('Tertiary', cs.tertiary, cs.onTertiary),
      ('Error', cs.error, cs.onError),
      ('Surface', cs.surface, cs.onSurface),
      ('Outline', cs.outline, cs.surface),
    ];

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Color Scheme',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: colors.map((c) {
                return Container(
                  width: (MediaQuery.of(context).size.width - 72) / 3,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: c.$2,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: cs.outlineVariant, width: 0.5),
                  ),
                  child: Text(
                    c.$1,
                    style: TextStyle(
                      color: c.$3,
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
