import 'package:flutter/material.dart';

abstract class Styles{

  static const  lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006E2F),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFF78FD95),
  onPrimaryContainer: Color(0xFF002109),
  secondary: Color(0xFF516351),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFD4E8D1),
  onSecondaryContainer: Color(0xFF0F1F11),
  tertiary: Color(0xFF9F3A62),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFFFD9E2),
  onTertiaryContainer: Color(0xFF3E001D),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFCFDF7),
  onBackground: Color(0xFF1A1C19),
  surface: Color(0xFFFCFDF7),
  onSurface: Color(0xFF1A1C19),
  surfaceVariant: Color(0xFFDDE5DA),
  onSurfaceVariant: Color(0xFF414941),
  outline: Color(0xFF727970),
  onInverseSurface: Color(0xFFF0F1EC),
  inverseSurface: Color(0xFF2E312E),
  inversePrimary: Color(0xFF59E07C),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006E2F),
  outlineVariant: Color(0xFFC1C9BE),
  scrim: Color(0xFF000000),
);
static const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF59E07C),
  onPrimary: Color(0xFF003915),
  primaryContainer: Color(0xFF005321),
  onPrimaryContainer: Color(0xFF78FD95),
  secondary: Color(0xFFB8CCB6),
  onSecondary: Color(0xFF233425),
  secondaryContainer: Color(0xFF394B3A),
  onSecondaryContainer: Color(0xFFD4E8D1),
  tertiary: Color(0xFFFFB0C8),
  onTertiary: Color(0xFF630533),
  tertiaryContainer: Color(0xFF81214A),
  onTertiaryContainer: Color(0xFFFFD9E2),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF1A1C19),
  onBackground: Color(0xFFE2E3DD),
  surface: Color(0xFF1A1C19),
  onSurface: Color(0xFFE2E3DD),
  surfaceVariant: Color(0xFF414941),
  onSurfaceVariant: Color(0xFFC1C9BE),
  outline: Color(0xFF8B9389),
  onInverseSurface: Color(0xFF1A1C19),
  inverseSurface: Color(0xFFE2E3DD),
  inversePrimary: Color(0xFF006E2F),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF59E07C),
  outlineVariant: Color(0xFF414941),
  scrim: Color(0xFF000000),
);

  static const TextStyle productRowItemName = TextStyle(
 fontSize: 18,
 fontStyle: FontStyle.normal,
 fontWeight: FontWeight.normal,
); // TextStyle

static const TextStyle productRowTotal = TextStyle(
  fontSize: 18,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.bold,
);
static const TextStyle productRowItemPrice = TextStyle(
  color: Color(0xFF8E8E93),
  fontSize: 13,
  fontWeight: FontWeight.w300,
);

static const TextStyle searchText = TextStyle(
  fontSize: 14,
  fontStyle: FontStyle.normal,
  fontWeight: FontWeight.normal, 
);

static const TextStyle deliveryTimeLabel = TextStyle(
color: Color(0xFFC2C2C2),
  fontWeight: FontWeight.w300, 
);
}