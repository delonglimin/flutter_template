import 'package:flutter/material.dart';

///白天模式
ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.red,
  backgroundColor: Colors.white,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.red, unselectedItemColor: Colors.grey),
);

///夜间模式
ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.grey,
  backgroundColor: Colors.black,
  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Colors.tealAccent, unselectedItemColor: Colors.blue),
);
