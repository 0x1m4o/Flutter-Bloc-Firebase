// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int counter;
  CounterState({
    required this.counter,
  });

  // Create an CounterState initiol value. The value is 0
  factory CounterState.initial() {
    return CounterState(counter: 0);
  }

  @override
  String toString() => 'CounterState(counter: $counter)';

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [counter];
}
