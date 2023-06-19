import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hindi_course/features/counter/bloc/counter_bloc.dart';
import 'package:flutter_hindi_course/features/counter/ui/second_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final CounterBloc counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CounterBloc, CounterState>(
      bloc: counterBloc,
      listenWhen: (previous, current) => current is CounterActionState,
      buildWhen: (previous, current) => current is! CounterActionState,
      listener: (context, state) {
        if (state is CounterNavigateToSecondPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => SecondPage(counterBloc: counterBloc,)));
        } else if (state is CounterIncrementActionState ||
            state is CounterDecrementActionState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  counterBloc.count.toString(),
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterNavigateToSecondPageEvent());
                    },
                    child: Text('Navigate')),
                ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterIncrementEvent());
                    },
                    child: Text('Increment')),
                ElevatedButton(
                    onPressed: () {
                      counterBloc.add(CounterDecrementEvent());
                    },
                    child: Text('Decrement'))
              ],
            ),
          ),
        );
      },
    );
  }
}
