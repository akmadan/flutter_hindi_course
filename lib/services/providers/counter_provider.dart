import 'package:flutter/cupertino.dart';

class CounterProvider extends ChangeNotifier {
  int number = 0;

  void increment() {
    number = number + 1;
    notifyListeners();
  }

  void decrement() {
    number = number - 1;
    notifyListeners();
  }

  void reset(){ 
    number = 0;
    notifyListeners();
  }
}
