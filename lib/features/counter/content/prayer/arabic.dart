import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';
import 'package:tefriciye/exts/build_context_exts.dart';
import 'package:tefriciye/exts/material_exts.dart';

import 'card.dart';

class Arabic extends StatelessWidget {
  const Arabic({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = context.theme.brightness == Brightness.dark;

    final colors = context.colors;
    final cardColor = colors.surfaceTone1;

    return PrayerCard(
      color: cardColor,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Opacity(
          opacity: isDarkTheme ? 0.8 : 1.0,
          child: Image.asset(
            isDarkTheme
                ? 'assets/img/prayer_dark.png'
                : 'assets/img/prayer_light.png',
            colorBlendMode: isDarkTheme ? BlendMode.lighten : BlendMode.darken,
            color: cardColor,
          ),
        ),
      ),
    );
  }
}
