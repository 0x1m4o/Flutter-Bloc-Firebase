import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_firebase/cubits/color/color_bloc.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  int incrementSize = 1;
  final ColorBloc colorBloc;
  late final StreamSubscription streamSubscription;
  CounterBloc({required this.colorBloc}) : super(CounterState.initial()) {
    streamSubscription = colorBloc.stream.listen((ColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        add(ChangeCounterEvent());
        incrementSize = -100;
      }
    });
    on<ChangeCounterEvent>(
      (event, emit) {
        emit(state.copyWith(counter: state.counter + incrementSize));
      },
    );
  }
  @override
  Future<void> close() {
    streamSubscription.cancel();
    return super.close();
  }
}
