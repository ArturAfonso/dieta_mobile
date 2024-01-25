import 'package:dieta_mobile/app/data/shared/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
part 'color_schemes.g.dart';

ThemeData get lightTheme => ThemeData(
      fontFamily: FontsConst.GILMER,
      textTheme: const TextTheme(
          bodyMedium: TextStyle(fontSize: 18), bodyLarge: TextStyle(fontSize: 18), bodySmall: TextStyle(fontSize: 13)),
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: FontsConst.GILMER_MEDIUM,
            color: _lightColorScheme.onPrimary,
          ),
          centerTitle: true,
          backgroundColor: _darkColorScheme.primary,
          iconTheme: IconThemeData(color: _lightColorScheme.onPrimary)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
      segmentedButtonTheme: _segmentedButtonTheme,
    );

ThemeData get darkTheme => ThemeData(
      fontFamily: 'Gilmer',
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontFamily: FontsConst.GILMER_MEDIUM,
            color: _darkColorScheme.onPrimary,
          ),
          centerTitle: true,
          backgroundColor: _darkColorScheme.primary,
          iconTheme: IconThemeData(color: _darkColorScheme.onPrimary)),
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
























/**
 ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _lightColorScheme.primaryContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _lightColorScheme.primary,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
      segmentedButtonTheme: _segmentedButtonTheme,
    );

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _darkColorScheme.primaryContainer,
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




 */