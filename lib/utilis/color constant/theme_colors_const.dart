import 'package:flutter/material.dart';

// Light theme data
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.black, // Primary color
    primary: Colors.black, // Primary color for elements
    secondary: Colors.grey[700]!, // Secondary color
    surface: Colors.grey[200]!, // Surface color
    onSurface: Colors.black, // Text color on surfaces
    background: Colors.white, // Background color
    onBackground: Colors.black, // Text color on background
    error: Colors.red, // Error color
    onError: Colors.white, // Text color on error
    brightness: Brightness.light,
  ),
  textTheme: Typography.blackMountainView.apply(
    bodyColor: Colors.black,
    displayColor: Colors.black,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.grey[800], // AppBar background color
    foregroundColor: Colors.white, // AppBar text color
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.black, // Button background color
    textTheme: ButtonTextTheme.primary, // Button text color
  ),
  scaffoldBackgroundColor: Colors.white, // Background for Scaffold
);

// Dark theme data
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.white, // Primary color
    primary: Colors.white, // Primary color for elements
    secondary: Colors.grey[400]!, // Secondary color
    surface: Colors.grey[850]!, // Surface color
    onSurface: Colors.white, // Text color on surfaces
    background: Colors.black, // Background color
    onBackground: Colors.white, // Text color on background
    error: Colors.red, // Error color
    onError: Colors.black, // Text color on error
    brightness: Brightness.dark,
  ),
  textTheme: Typography.whiteMountainView.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white,
  ),
  appBarTheme: AppBarTheme(
    color: Colors.grey[900], // AppBar background color
    foregroundColor: Colors.white, // AppBar text color
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.white, // Button background color
    textTheme: ButtonTextTheme.primary, // Button text color
  ),
  scaffoldBackgroundColor: Colors.black, // Background for Scaffold
);
