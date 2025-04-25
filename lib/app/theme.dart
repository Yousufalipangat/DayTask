import "package:flutter/material.dart";

class Ccolor {
  static const Color Charleston_Green = Color.fromARGB(255, 33, 40, 50);
  static const Color Deep_Space_Sparkle = Color.fromARGB(255, 69, 90, 100);
  static const Color Orange_Yellow = Color.fromARGB(255, 254, 211, 106);
  static const Color Pewter_Blue = Color.fromARGB(255, 140, 170, 185);
  static const Color Gunmetal = Color.fromARGB(255, 38, 50, 56);

  static const Color Catfish = Color.fromARGB(255, 107, 123, 131);
  static const Color Grey_Area = Color.fromARGB(255, 143, 148, 152);
}

class AppTheme {
  static final ThemeData DarkTheme = ThemeData(
    hintColor: Colors.white54,
    useMaterial3: true,
    // brightness: Brightness.dark,
    // primaryColor: Ccolor.Charleston_Green,
    colorScheme: ColorScheme(

        brightness: Brightness.dark,
        primary: Colors.white,
        onPrimary: Ccolor.Orange_Yellow,
        secondary: Ccolor.Orange_Yellow,
        onSecondary: Ccolor.Charleston_Green,
        error: Colors.redAccent,
        onError: Ccolor.Charleston_Green,
        surface: Ccolor.Charleston_Green,
        onSurface: Colors.white,
        tertiary: Ccolor.Catfish,
        onTertiary: Ccolor.Gunmetal


    ),
    expansionTileTheme: ExpansionTileThemeData(
      childrenPadding: EdgeInsets.all(10),
      backgroundColor: Ccolor.Deep_Space_Sparkle
    ),
    // scaffoldBackgroundColor: Ccolor.Charleston_Green,
    dividerTheme: DividerThemeData(
      color: Ccolor.Grey_Area
    ),
    appBarTheme: AppBarTheme(
      color: Ccolor.Gunmetal
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            backgroundColor: Ccolor.Orange_Yellow,
            foregroundColor: Ccolor.Charleston_Green,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(3)))),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
          // backgroundColor: Ccolor.Charleston_Green,
          // foregroundColor: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
          side: BorderSide(
              color: Colors.white,
              style: BorderStyle.solid,
              width: 2)),
    ),
    textTheme: TextTheme(

      headlineLarge: TextStyle(
        fontSize: 20, color: Colors.white,
      ),

        labelLarge: TextStyle(
          fontSize: 20, color: Ccolor.Grey_Area,
        ),
        labelMedium: TextStyle(
          fontSize: 17, color: Ccolor.Grey_Area,
        ),
        labelSmall: TextStyle(
          fontSize: 14, color: Ccolor.Grey_Area,
        )),
  );
}
