import 'package:flextensions/flextensions.dart';
import 'package:flutter/material.dart';

const _kDefaultSeedColor = Color(0xff5BA44D);

class AppTheme {
  static ThemeData light([Color? seed]) => make(seed, Brightness.light);
  static ThemeData dark([Color? seed]) => make(seed, Brightness.dark);

  static ThemeData make(Color? seed, Brightness brightness) {
    final colors = ColorScheme.fromSeed(
      seedColor: seed ?? _kDefaultSeedColor,
      brightness: brightness,
    );
    final theme = ThemeData(
      useMaterial3: true,
      colorScheme: colors,
      splashColor: colors.primary.withOpacity(0.1),
      focusColor: colors.primary.withOpacity(0.05),
      hoverColor: colors.primary.withOpacity(0.05),
      highlightColor: colors.primary.withOpacity(0.05),
      splashFactory: InkSparkle.splashFactory,
    );
    return theme;
  }

  /// Returns a version of the app theme with the given [seed] color based
  /// on the brightness of the theme at [context]. If [color] is null, returns
  /// the existing theme at [context].
  static ThemeData override(BuildContext context, Color? color) {
    final theme = context.theme;
    final brightness = theme.brightness;
    if (color == null) {
      return theme;
    } else {
      return brightness == Brightness.light ? light(color) : dark(color);
    }
  }
}
