import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hindi_course/pages/secondary.dart';
import 'package:flutter_hindi_course/services/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(
      builder: (context, counterModel, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            counterModel.increment();
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                counterModel.number.toString(),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Secondary()));
                    },
                    child: Text('Navigate')),
              ), 
              const SizedBox(height: 20),
              SizedBox(
                width: 300,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                    counterModel.decrement();
                    },
                    child: Text('Decrement')),
              )
            ],
          ),
        ),
      ),
    );
  }
}
