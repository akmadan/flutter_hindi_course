import 'package:flutter/material.dart';
import 'package:flutter_hindi_course/features/counter/ui/first_page.dart';


void main(){ 
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FirstPage(),
    );
  }
}