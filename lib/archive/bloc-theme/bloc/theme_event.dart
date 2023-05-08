// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();

  @override
  List<Object> get props => [];
}

class ChangeThemeEvent extends ThemeEvent {
  final bool isDark;
  ChangeThemeEvent({
    required this.isDark,
  });

  @override
  String toString() => 'ChangeThemeEvent(isDark: $isDark)';

  @override
  List<Object> get props => [isDark];
}
