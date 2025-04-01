import 'package:flutter/material.dart';
import 'package:expense_tracker/Widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);
var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 5, 9, 125),
  brightness: Brightness.dark,
);

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: kColorScheme.onSecondaryContainer,
              ),
              bodyMedium: TextStyle(
                color: kColorScheme.onSurface,
              ),
            ),
        dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: TextStyle(
            color: kColorScheme.onSecondary,
          ),
        ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme(
          backgroundColor: kDarkColorScheme.onPrimaryContainer,
          foregroundColor: kDarkColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorScheme.surface,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor:
                kDarkColorScheme.primaryContainer, // Button background
            foregroundColor:
                kDarkColorScheme.onPrimaryContainer, // Button text/icon color
            textStyle: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: kDarkColorScheme.onBackground,
              ),
              bodyMedium: TextStyle(
                color: kDarkColorScheme.onSurface,
              ),
            ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(
            color: kDarkColorScheme.onSurface.withOpacity(0.7),
          ),
          hintStyle: TextStyle(
            color: kDarkColorScheme.onSurface.withOpacity(0.5),
          ),
          prefixStyle: TextStyle(
            color: kDarkColorScheme.onSurface,
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: kDarkColorScheme.onSurface),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: kDarkColorScheme.onSurface.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: kDarkColorScheme.primary),
          ),
        ),
        dropdownMenuTheme: DropdownMenuThemeData(
          textStyle: TextStyle(
            color: kDarkColorScheme.onSurface, // Dropdown item text
            fontWeight: FontWeight.w500, // Slightly bolder for readability
          ),
          menuStyle: MenuStyle(
            backgroundColor: MaterialStateProperty.all(kDarkColorScheme
                .surfaceContainer), // Slightly lighter than surface
            surfaceTintColor: MaterialStateProperty.all(Colors.transparent),
            elevation: MaterialStateProperty.all(8), // Subtle shadow for depth
          ),
        ),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: kDarkColorScheme.surface,
          surfaceTintColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
          ),
        ),
      ),
      home: const Expenses(),
    ),
  );
}
