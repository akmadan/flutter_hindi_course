import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  bool isLogin = true;

  changeIsLoginValue() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login/SignUp'),
      ),
      body: Form(
        key: _formKey,
        child: Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            children: [
              if (!isLogin)
                const TextField(
                  key: ValueKey('first_name'),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter First Name'),
                ),
              if (!isLogin)
                const TextField(
                  key: ValueKey('last_name'),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter Last Name'),
                ),
              const TextField(
                key: ValueKey('email'),
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email), hintText: 'Enter Email'),
              ),
              const TextField(
                key: ValueKey('password'),
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.security),
                    hintText: 'Enter Password'),
              ),
              const SizedBox(height: 40),
              SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      child: Text(isLogin ? "Login" : "SignUp"))),
              TextButton(
                  onPressed: () => changeIsLoginValue(),
                  child: isLogin
                      ? const Text("Don't have an account? SignUp")
                      :const Text('Already have an account? Login'))
            ],
          ),
        ),
      ),
    );
  }
}
