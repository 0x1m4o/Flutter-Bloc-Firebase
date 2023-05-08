// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_cubit.dart';

class CounterState extends Equatable {
  // Create an integer for cubit
  final int counter;

  // Create a constructer
  CounterState({
    required this.counter,
  });

  // Create an CounterState initiol value. The value is 0
  factory CounterState.initial() {
    return CounterState(counter: 0);
  }

  @override
  List<Object> get props => [counter];

  // Create toString
  @override
  String toString() => 'CounterState(counter: $counter)';

  // Create copyWith
  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }
}
