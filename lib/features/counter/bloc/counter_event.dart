part of 'counter_bloc.dart';

@immutable
abstract class CounterEvent {}

//navigate

class CounterNavigateToSecondPageEvent extends CounterEvent {}

// increment

class CounterIncrementEvent extends CounterEvent {}

// decrement

class CounterDecrementEvent extends CounterEvent {}
