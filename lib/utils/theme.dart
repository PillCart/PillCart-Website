import 'package:flutter/material.dart';
import 'package:pillcart_website/helper/constant.dart';

ThemeData customLightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Lexend_Regular',
  appBarTheme: const AppBarTheme(
    toolbarHeight: 56,
    backgroundColor: Colors.transparent,
    elevation: 0,
    titleTextStyle: TextStyle(fontFamily: 'Lexend_SemiBold', fontSize: 24, color: kBrand800),
  ),
  textTheme: const TextTheme().copyWith(
    //* displays
    displayLarge: const TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 48,
    ),
    displayMedium: const TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 42,
    ),
    displaySmall: const TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 34,
    ),
    //* labels
    labelLarge: const TextStyle(
      fontFamily: 'Lexend_SemiBold',
      fontSize: 18,
    ),
    labelMedium: const TextStyle(
      fontSize: 16,
    ),
    labelSmall: const TextStyle(
      fontSize: 14,
    ),
    //* body
    bodySmall: const TextStyle(
      fontSize: 16,
    ),
    bodyMedium: const TextStyle(
      fontSize: 18,
    ),
    bodyLarge: const TextStyle(
      fontSize: 20,
    ),
    //* headline
    headlineSmall: const TextStyle(
      fontFamily: 'Lexend_SemiBold',
      fontSize: 20,
    ),

    headlineLarge: const TextStyle(
      fontFamily: 'Lexend_SemiBold',
      fontSize: 24,
    ),
    //* title
    titleSmall: const TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 16,
    ),
    titleLarge: const TextStyle(
      fontFamily: 'Lexend_Bold',
      fontSize: 18,
    ),
  ),
);
