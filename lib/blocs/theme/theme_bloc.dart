import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> with HydratedMixin {
  ThemeBloc() : super(ThemeState.initial()) {
    on<ToggleThemeEvent>((event, emit) {
      emit(state.copyWith(
          appTheme: state.appTheme == AppTheme.light
              ? AppTheme.dark
              : AppTheme.light));
    });
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    final result = ThemeState.fromJson(json);

    return result;
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    final sendResult = state.toJson();
    return sendResult;
  }
}
