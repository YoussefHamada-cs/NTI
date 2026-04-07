import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_theme/colors_showcase_card.dart';
import 'package:task_theme/theme_bloc/theme_bloc.dart';
import 'package:task_theme/theme_selector_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        final colorScheme = Theme.of(context).colorScheme;
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Scaffold(
          appBar: AppBar(
            title: const Text('Theme Switcher'),
            backgroundColor: colorScheme.surface,
            foregroundColor: colorScheme.onSurface,
            actions: [
              IconButton(
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                tooltip: isDark ? 'Switch to Light' : 'Switch to Dark',
                onPressed: () {
                  context.read<ThemeBloc>().add(
                    ChangeThemeEvent(isDark ? ThemeMode.light : ThemeMode.dark),
                  );
                },
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ThemeSelectorCard(),
                const SizedBox(height: 16),

                const ColorsShowcaseCard(),
                const SizedBox(height: 16),
              ],
            ),
          ),
        );
      },
    );
  }
}
