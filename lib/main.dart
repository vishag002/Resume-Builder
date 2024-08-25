import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:resume_builder/controller/theme_controller.dart';
import 'package:resume_builder/utilis/color%20constant/theme_colors_const.dart';
import 'package:resume_builder/view/home/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return AdaptiveTheme(
          light: lightTheme,
          dark: darkTheme,
          initial: themeProvider.themeMode,
          builder: (theme, darkTheme) => GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme, // Apply the light theme
            darkTheme: darkTheme, // Apply the dark theme
            home: HomeScreen(), // Your HomeScreen
          ),
        );
      },
    );
  }
}
