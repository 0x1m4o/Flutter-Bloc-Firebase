// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int count;
  const CounterState({
    required this.count,
  });

  factory CounterState.initial() {
    return const CounterState(count: 0);
  }

  @override
  List<Object> get props => [count];

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(
      count: count ?? this.count,
    );
  }

  @override
  bool get stringify => true;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'count': count,
    };
  }

  factory CounterState.fromJson(Map<String, dynamic> json) {
    return CounterState(
      count: json['count'] as int,
    );
  }
}
