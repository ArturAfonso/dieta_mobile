import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
      textTheme: GoogleFonts.nunitoSansTextTheme(
        const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, height: 1.3),
          bodyMedium: TextStyle(fontSize: 16, height: 1.3),
          titleMedium: TextStyle(fontSize: 14, height: 1.3),
          titleSmall: TextStyle(fontSize: 12, height: 1.3),
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1.3),
          displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.3),
        ),
      ),
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _lightColorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: _lightColorScheme.primary,
        iconTheme: IconThemeData(color: _lightColorScheme.onPrimary),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
      segmentedButtonTheme: _segmentedButtonTheme,
    );

ThemeData get darkTheme => ThemeData(
      textTheme: GoogleFonts.nunitoSansTextTheme(
        const TextTheme(
          bodyLarge: TextStyle(fontSize: 18, height: 1.3),
          bodyMedium: TextStyle(fontSize: 16, height: 1.3),
          titleMedium: TextStyle(fontSize: 14, height: 1.3),
          titleSmall: TextStyle(fontSize: 12, height: 1.3),
          displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, height: 1.3),
          displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, height: 1.3),
        ),
      ),
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
        titleTextStyle: GoogleFonts.nunitoSans(
          textStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: _darkColorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: _darkColorScheme.primary,
        iconTheme: IconThemeData(color: _darkColorScheme.onPrimary),
      ),
      segmentedButtonTheme: _segmentedButtonTheme,
    );

SegmentedButtonThemeData get _segmentedButtonTheme => SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) {
          if (states.contains(MaterialState.selected)) {
            return const TextStyle(
              fontSize: 9,
            );
          }

          return const TextStyle(
            fontSize: 12,
          );
        }),
      ),
    );

ThemeMode getTheme() {
  var storage = GetStorage('storage');
  var theme = storage.read('theme');
  if (theme != null) {
    if (theme == 'light') {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  } else {
    return ThemeMode.light;
  }
}
