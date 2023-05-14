import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hindi_course/services/functions/authentication.dart';

class AuthenticationForm extends StatefulWidget {
  const AuthenticationForm({super.key});

  @override
  State<AuthenticationForm> createState() => _AuthenticationFormState();
}

class _AuthenticationFormState extends State<AuthenticationForm> {
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String fName = '';
  String lName = '';
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
                TextFormField(
                  key: const ValueKey('first_name'),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter First Name'),
                  validator: (val) {
                    if (val.toString().length < 2) {
                      return 'Please Enter a Valid First Name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      fName = val.toString();
                    });
                  },
                ),
              if (!isLogin)
                TextFormField(
                  key: const ValueKey('last_name'),
                  decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      hintText: 'Enter Last Name'),
                  validator: (val) {
                    if (val.toString().length < 2) {
                      return 'Please Enter a Valid Last Name';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (val) {
                    setState(() {
                      lName = val.toString();
                    });
                  },
                ),
              TextFormField(
                key: const ValueKey('email'),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email), hintText: 'Enter Email'),
                validator: (val) {
                  if (val.toString().isEmpty || !val.toString().contains('@')) {
                    return 'Please Enter a Valid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  setState(() {
                    email = val.toString();
                  });
                },
              ),
              TextFormField(
                key: const ValueKey('password'),
                obscureText: true,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.security),
                    hintText: 'Enter Password'),
                validator: (val) {
                  if (val.toString().length < 6 ||
                      !val.toString().contains('#')) {
                    return 'Please Enter a Valid Password';
                  } else {
                    return null;
                  }
                },
                onSaved: (val) {
                  setState(() {
                    password = val.toString();
                  });
                },
              ),
              const SizedBox(height: 40),
              SizedBox(
                  width: double.maxFinite,
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          isLogin
                              ? AuthenticationFunctions.signIn(email, password)
                              : AuthenticationFunctions.singUp(
                                  context, email, password, fName, lName);
                        }
                      },
                      child: Text(isLogin ? "Login" : "SignUp"))),
              TextButton(
                  onPressed: () => changeIsLoginValue(),
                  child: isLogin
                      ? const Text("Don't have an account? SignUp")
                      : const Text('Already have an account? Login'))
            ],
          ),
        ),
      ),
    );
  }
}
