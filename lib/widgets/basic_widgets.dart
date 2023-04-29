import 'package:flutter/material.dart';

class BasicWidgets extends StatelessWidget {
  const BasicWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
      ),
      body:
        // Containers
          Center(
        child: Container(
          height: 200,
          width: 200,
          decoration: BoxDecoration(
              color: Colors.red,
              // border: Border.all(color: Colors.black, width: 10),
              boxShadow: [
                BoxShadow(
                    offset:const Offset(6, 6), color: Colors.black.withOpacity(0.5))
              ],
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Container(
              height: 100,
              width: 100,
              color: Colors.yellow,
              child: Center(
                  child: Container(
                padding: const EdgeInsets.all(4),
                height: 50,
                width: 50,
                color: Colors.green,
                child: Container(
                  color: Colors.blue,
                ),
              )),
            ),
          ),
        ),
      ),

      // Column
      // Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //         margin: const EdgeInsets.all(6),
      //         height: 100,
      //         width: 100,
      //         color: Colors.green,
      //       ),
      // Container(
      //   margin: const EdgeInsets.all(6),
      //   height: 100,
      //   width: 100,
      //   color: Colors.green,
      // ),
      //       Container(
      //         margin: const EdgeInsets.all(6),
      //         height: 100,
      //         width: 100,
      //         color: Colors.green,
      //       ),
      //       Container(
      //         margin: const EdgeInsets.all(6),
      //         height: 100,
      //         width: 100,
      //         color: Colors.green,
      //       ),
      //     ],
      //   ),

      // Row
      // Center(
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //   children: [
      //     Container(
      //       margin: const EdgeInsets.all(6),
      //       height: 100,
      //       width: 100,
      //       color: Colors.green,
      //     ),
      //      Container(
      //       margin: const EdgeInsets.all(6),
      //       height: 100,
      //       width: 100,
      //       color: Colors.green,
      //     ),
      //      Container(
      //       margin: const EdgeInsets.all(6),
      //       height: 100,
      //       width: 100,
      //       color: Colors.green,
      //     ),

      //   ],
      // ))
    );
  }
}
