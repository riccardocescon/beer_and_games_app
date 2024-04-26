import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  // static MaterialScheme lightScheme() {
  //   return const MaterialScheme(
  //     brightness: Brightness.light,
  //     primary: Color(0xFFD0BCFF),
  //     surfaceTint: Color(0xFF141218),
  //     onPrimary: Color(0xFF381E72),
  //     primaryContainer: Color(0xFF4F378B),
  //     onPrimaryContainer: Color(0xFFEADDFF),
  //     secondary: Color(0xFFCCC2DC),
  //     onSecondary: Color(0xFF332D41),
  //     secondaryContainer: Color(0xFF4A4458),
  //     onSecondaryContainer: Color(0xFFE8DEF8),
  //     tertiary: Color(0xFFEFB8C8),
  //     onTertiary: Color(0xFF492532),
  //     tertiaryContainer: Color(0xFF633B48),
  //     onTertiaryContainer: Color(0xFFFFD8E4),
  //     error: Color(0xFFF2B8B5),
  //     onError: Color(0xFF601410),
  //     errorContainer: Color(0xFF8C1D18),
  //     onErrorContainer: Color(0xFFF9DEDC),
  //     background: Color(0xFF141218),
  //     onBackground: Color(0xFFE6E0E9),
  //     surface: Color(0xFF141218),
  //     onSurface: Color(0xFFE6E0E9),
  //     surfaceVariant: Color(0xFF141218),
  //     onSurfaceVariant: Color(0xFFCAC4D0),
  //     outline: Color(0xFF938F99),
  //     outlineVariant: Color(0xFF49454F),
  //     shadow: Color(0xFF000000),
  //     scrim: Color(0xFF000000),
  //     inverseSurface: Color(0xFFE6E0E9),
  //     inverseOnSurface: Color(0xFF322F35),
  //     inversePrimary: Color(0xFF6750A4),
  //     primaryFixed: Color(0xFFEADDFF),
  //     onPrimaryFixed: Color(0xFF21005D),
  //     primaryFixedDim: Color(0xFFD0BCFF),
  //     onPrimaryFixedVariant: Color(0xFF4F378B),
  //     secondaryFixed: Color(0xFFE8DEF8),
  //     onSecondaryFixed: Color(0xFF1D192B),
  //     secondaryFixedDim: Color(0xFFCCC2DC),
  //     onSecondaryFixedVariant: Color(0xFF4A4458),
  //     tertiaryFixed: Color(0xFFFFD8E4),
  //     onTertiaryFixed: Color(0xFF31111D),
  //     tertiaryFixedDim: Color(0xFFEFB8C8),
  //     onTertiaryFixedVariant: Color(0xFF633B48),
  //     surfaceDim: Color(0xFF141218),
  //     surfaceBright: Color(0xFF3B383E),
  //     surfaceContainerLowest: Color(0xFF0F0D13),
  //     surfaceContainerLow: Color(0xFF1D1B20),
  //     surfaceContainer: Color(0xFF211F26),
  //     surfaceContainerHigh: Color(0xFF2B2930),
  //     surfaceContainerHighest: Color(0xFF36343B),
  //   );
  // }

  // ThemeData light() {
  //   return theme(lightScheme().toColorScheme());
  // }

  static MaterialScheme darkScheme() {
    return const MaterialScheme(
      brightness: Brightness.dark,
      primary: Color(0xFFD0BCFF),
      surfaceTint: Color(0xFF141218),
      onPrimary: Color(0xFF381E72),
      primaryContainer: Color(0xFF4F378B),
      onPrimaryContainer: Color(0xFFEADDFF),
      secondary: Color(0xFFCCC2DC),
      onSecondary: Color(0xFF332D41),
      secondaryContainer: Color(0xFF4A4458),
      onSecondaryContainer: Color(0xFFE8DEF8),
      tertiary: Color(0xFFEFB8C8),
      onTertiary: Color(0xFF492532),
      tertiaryContainer: Color(0xFF633B48),
      onTertiaryContainer: Color(0xFFFFD8E4),
      error: Color(0xFFF2B8B5),
      onError: Color(0xFF601410),
      errorContainer: Color(0xFF8C1D18),
      onErrorContainer: Color(0xFFF9DEDC),
      background: Color(0xFF141218),
      onBackground: Color(0xFFE6E0E9),
      surface: Color(0xFF141218),
      onSurface: Color(0xFFE6E0E9),
      surfaceVariant: Color(0xFF141218),
      onSurfaceVariant: Color(0xFFCAC4D0),
      outline: Color(0xFF938F99),
      outlineVariant: Color(0xFF49454F),
      shadow: Color(0xFF000000),
      scrim: Color(0xFF000000),
      inverseSurface: Color(0xFFE6E0E9),
      inverseOnSurface: Color(0xFF322F35),
      inversePrimary: Color(0xFF6750A4),
      primaryFixed: Color(0xFFEADDFF),
      onPrimaryFixed: Color(0xFF21005D),
      primaryFixedDim: Color(0xFFD0BCFF),
      onPrimaryFixedVariant: Color(0xFF4F378B),
      secondaryFixed: Color(0xFFE8DEF8),
      onSecondaryFixed: Color(0xFF1D192B),
      secondaryFixedDim: Color(0xFFCCC2DC),
      onSecondaryFixedVariant: Color(0xFF4A4458),
      tertiaryFixed: Color(0xFFFFD8E4),
      onTertiaryFixed: Color(0xFF31111D),
      tertiaryFixedDim: Color(0xFFEFB8C8),
      onTertiaryFixedVariant: Color(0xFF633B48),
      surfaceDim: Color(0xFF141218),
      surfaceBright: Color(0xFF3B383E),
      surfaceContainerLowest: Color(0xFF0F0D13),
      surfaceContainerLow: Color(0xFF1D1B20),
      surfaceContainer: Color(0xFF211F26),
      surfaceContainerHigh: Color(0xFF2B2930),
      surfaceContainerHighest: Color(0xFF36343B),
    );
  }

  ThemeData dark() {
    return theme(darkScheme().toColorScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
        useMaterial3: true,
        brightness: colorScheme.brightness,
        colorScheme: colorScheme,
        textTheme: textTheme.apply(
          bodyColor: colorScheme.onSurface,
          displayColor: colorScheme.onSurface,
        ),
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.surface,
      );

  List<ExtendedColor> get extendedColors => [];
}

class MaterialScheme {
  const MaterialScheme({
    required this.brightness,
    required this.primary,
    required this.surfaceTint,
    required this.onPrimary,
    required this.primaryContainer,
    required this.onPrimaryContainer,
    required this.secondary,
    required this.onSecondary,
    required this.secondaryContainer,
    required this.onSecondaryContainer,
    required this.tertiary,
    required this.onTertiary,
    required this.tertiaryContainer,
    required this.onTertiaryContainer,
    required this.error,
    required this.onError,
    required this.errorContainer,
    required this.onErrorContainer,
    required this.background,
    required this.onBackground,
    required this.surface,
    required this.onSurface,
    required this.surfaceVariant,
    required this.onSurfaceVariant,
    required this.outline,
    required this.outlineVariant,
    required this.shadow,
    required this.scrim,
    required this.inverseSurface,
    required this.inverseOnSurface,
    required this.inversePrimary,
    required this.primaryFixed,
    required this.onPrimaryFixed,
    required this.primaryFixedDim,
    required this.onPrimaryFixedVariant,
    required this.secondaryFixed,
    required this.onSecondaryFixed,
    required this.secondaryFixedDim,
    required this.onSecondaryFixedVariant,
    required this.tertiaryFixed,
    required this.onTertiaryFixed,
    required this.tertiaryFixedDim,
    required this.onTertiaryFixedVariant,
    required this.surfaceDim,
    required this.surfaceBright,
    required this.surfaceContainerLowest,
    required this.surfaceContainerLow,
    required this.surfaceContainer,
    required this.surfaceContainerHigh,
    required this.surfaceContainerHighest,
  });

  final Brightness brightness;
  final Color primary;
  final Color surfaceTint;
  final Color onPrimary;
  final Color primaryContainer;
  final Color onPrimaryContainer;
  final Color secondary;
  final Color onSecondary;
  final Color secondaryContainer;
  final Color onSecondaryContainer;
  final Color tertiary;
  final Color onTertiary;
  final Color tertiaryContainer;
  final Color onTertiaryContainer;
  final Color error;
  final Color onError;
  final Color errorContainer;
  final Color onErrorContainer;
  final Color background;
  final Color onBackground;
  final Color surface;
  final Color onSurface;
  final Color surfaceVariant;
  final Color onSurfaceVariant;
  final Color outline;
  final Color outlineVariant;
  final Color shadow;
  final Color scrim;
  final Color inverseSurface;
  final Color inverseOnSurface;
  final Color inversePrimary;
  final Color primaryFixed;
  final Color onPrimaryFixed;
  final Color primaryFixedDim;
  final Color onPrimaryFixedVariant;
  final Color secondaryFixed;
  final Color onSecondaryFixed;
  final Color secondaryFixedDim;
  final Color onSecondaryFixedVariant;
  final Color tertiaryFixed;
  final Color onTertiaryFixed;
  final Color tertiaryFixedDim;
  final Color onTertiaryFixedVariant;
  final Color surfaceDim;
  final Color surfaceBright;
  final Color surfaceContainerLowest;
  final Color surfaceContainerLow;
  final Color surfaceContainer;
  final Color surfaceContainerHigh;
  final Color surfaceContainerHighest;
}

extension MaterialSchemeUtils on MaterialScheme {
  ColorScheme toColorScheme() {
    return ColorScheme(
      brightness: brightness,
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: onSecondary,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: onSecondaryContainer,
      tertiary: tertiary,
      onTertiary: onTertiary,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: onTertiaryContainer,
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      onErrorContainer: onErrorContainer,
      background: background,
      onBackground: onBackground,
      surface: surface,
      onSurface: onSurface,
      surfaceVariant: surfaceVariant,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
      shadow: shadow,
      scrim: scrim,
      inverseSurface: inverseSurface,
      onInverseSurface: inverseOnSurface,
      inversePrimary: inversePrimary,
    );
  }
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
