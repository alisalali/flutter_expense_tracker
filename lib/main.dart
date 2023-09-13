import 'package:flutter/material.dart';

import 'package:expense_tracker/expenses.dart';

//Generate a [ColorScheme] derived from the given seedColor.
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 192, 255, 206),
);
void main() {
  runApp(
    MaterialApp(
      // to copy default material3 default settings
      theme: ThemeData().copyWith(
        useMaterial3: true,
        //apply colorScheme entire theme
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        // Modify Card Theme color
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 8,
          ),
        ),
        //Modify elevatedButtonTheme
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        // Modify TextsTheme widgets , with title
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondary,
                fontSize: 16,
              ),
            ),
      ),
      home: const Expenses(),
    ),
  );
}
