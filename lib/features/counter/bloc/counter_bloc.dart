import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    on<CounterNavigateToSecondPageEvent>(counterNavigateToSecondPageEvent);
    on<CounterIncrementEvent>(counterIncrementEvent);
    on<CounterDecrementEvent>(counterDecrementEvent);
  }

  int count = 0;

  FutureOr<void> counterNavigateToSecondPageEvent(
      CounterNavigateToSecondPageEvent event, Emitter<CounterState> emit) {
    emit(CounterNavigateToSecondPageActionState());
  }

  FutureOr<void> counterIncrementEvent(
      CounterIncrementEvent event, Emitter<CounterState> emit) {
    count += 1;
    emit(CounterIncrementActionState());
  }

  FutureOr<void> counterDecrementEvent(
      CounterDecrementEvent event, Emitter<CounterState> emit) {
    count -= 1;
    emit(CounterDecrementActionState());
  }
}
