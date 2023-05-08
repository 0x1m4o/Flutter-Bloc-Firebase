import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  // Create counter functions
  // Increment functions add one value to state.counter.
  void increment() {
    emit(state.copyWith(counter: state.counter + 1));
  }

  // Decrement functions minus one value to state.counter.
  void decrement() {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
