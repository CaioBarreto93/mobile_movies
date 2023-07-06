import 'package:flutter/material.dart';

abstract class AppTheme {
  static get themeData => ThemeData(
        scaffoldBackgroundColor: Colors.grey[300],
        primaryColor: Colors.black,
        //Tema do aplicativo
        primarySwatch: MaterialColor(
          Colors.grey.value,
          const {
            50: Colors.grey,
            100: Colors.grey,
            200: Colors.grey,
            300: Colors.grey,
            400: Colors.grey,
            500: Colors.grey,
            600: Colors.grey,
            700: Colors.grey,
            800: Colors.grey,
            900: Colors.grey,
          },
        ),
        // useMaterial3: false,
      );
}
