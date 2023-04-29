import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hindi_course/pages/home_page.dart';
import 'package:flutter_hindi_course/pages/login_page.dart';
import 'package:flutter_hindi_course/widgets/basic_widgets.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: BasicWidgets(),
    );
  }
}






