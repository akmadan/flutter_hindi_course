import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hindi_course/pages/home.dart';
import 'package:flutter_hindi_course/services/providers/counter_provider.dart';
import 'package:flutter_hindi_course/utils/colors.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CounterProvider>(
            create: (context) => CounterProvider())
      ],
      child: MaterialApp(
          theme: ThemeData(
              elevatedButtonTheme: ElevatedButtonThemeData(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(AppColors.primaryColor))),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                  backgroundColor: AppColors.primaryColor),
              appBarTheme: AppBarTheme(backgroundColor: AppColors.primaryColor),
              primaryColor: AppColors.primaryColor),
          home: Home()),
    );
  }
}
