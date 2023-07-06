import 'package:flutter/material.dart';
import './routes/routes_generator.dart';
import './shared/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      initialRoute: RoutesGenerator.loginPage,
      onGenerateRoute: RoutesGenerator.generate,
    );
  }
}
