// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_bloc.dart';

class CounterState extends Equatable {
  int counter;
  CounterState({
    required this.counter,
  });

  factory CounterState.initial() {
    return CounterState(counter: 1);
  }
  @override
  List<Object> get props => [counter];

  CounterState copyWith({
    int? counter,
  }) {
    return CounterState(
      counter: counter ?? this.counter,
    );
  }

  @override
  bool get stringify => true;
}
