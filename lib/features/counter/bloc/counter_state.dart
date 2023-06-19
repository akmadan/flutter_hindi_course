part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

abstract class CounterActionState extends CounterState {}

class CounterInitial extends CounterState {}

// navigate

class CounterNavigateToSecondPageActionState extends CounterActionState {}

// increment
class CounterIncrementActionState extends CounterActionState {}

// decrement
class CounterDecrementActionState extends CounterActionState {}
