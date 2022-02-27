import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static Color lightBackgroundColor = const Color(0xfff2f2f2);
  static Color lightPrimaryColor = const Color(0xfff2f2f2);
  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightParticlesColor = const Color(0x44948282);

  static Color darkBackgroundColor = const Color(0xFF1A2127);
  static Color darkPrimaryColor = const Color(0xFF1A2127);
  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkParticlesColor = const Color(0x441C2A3D);

  const AppTheme._();
  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: lightPrimaryColor,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: lightAccentColor,brightness: Brightness.light),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    backgroundColor: lightBackgroundColor,
  );


  static Brightness? get currentSystemBrightness => SchedulerBinding.instance?.window.platformBrightness;

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: darkAccentColor,brightness: Brightness.dark),
    backgroundColor: darkBackgroundColor,
  );

  static setStatusBarAndNavigationBarColors(ThemeMode themeMode){
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness:
        themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarIconBrightness:
        themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: themeMode == ThemeMode.light
          ? lightBackgroundColor
          : darkBackgroundColor,
      systemNavigationBarDividerColor: Colors.transparent

    ));
  }
}