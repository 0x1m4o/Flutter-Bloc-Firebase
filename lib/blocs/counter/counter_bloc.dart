import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> with HydratedMixin {
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(count: state.count + 1));
    });
    on<DecrementCounterEvent>((event, emit) {
      emit(state.copyWith(count: state.count - 1));
    });
  }

  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    final result = CounterState.fromJson(json);
    return result;
  }

  @override
  Map<String, dynamic>? toJson(CounterState state) {
    final sendResult = state.toJson();
    return sendResult;
  }
}
