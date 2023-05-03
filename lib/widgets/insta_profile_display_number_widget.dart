import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class InstaProfileDisplayNumberWidget extends StatelessWidget {
  final String count;
  final String label;
  const InstaProfileDisplayNumberWidget({super.key, required this.count, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [ 
        Text(count, style: TextStyle(fontWeight: FontWeight.bold),), 
        Text(label)
      ],
    );
  }
}