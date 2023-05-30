import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hindi_course/services/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class Secondary extends StatefulWidget {
  const Secondary({super.key});

  @override
  State<Secondary> createState() => _SecondaryState();
}

class _SecondaryState extends State<Secondary> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
        builder: ((context, counterProvider, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  counterProvider.increment();
                },
                child: const Center(
                  child: Icon(Icons.add),
                ),
              ),
              appBar: AppBar(
                title: const Text('Page 1'),
              ),
              body: Center(
                child: Column(
                  children: [
                    Text(
                      counterProvider.number.toString(),
                      style: const TextStyle(
                          color: Colors.red,
                          fontSize: 60,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 300,
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            counterProvider.decrement();
                          },
                          child: Text('Decrement')),
                    ),
                  ],
                ),
              ),
            )));
  }
}
