import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hindi_course/pages/authentication_form.dart';
import 'package:flutter_hindi_course/pages/insta_home_page.dart';
import 'package:flutter_hindi_course/pages/insta_profile_page.dart';
import 'package:flutter_hindi_course/widgets/basic_widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: AuthenticationForm());
  }
}
