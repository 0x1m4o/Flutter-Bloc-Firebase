// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'theme_bloc.dart';

enum AppTheme { light, dark }

class ThemeState extends Equatable {
  final AppTheme theme;
  ThemeState({
    this.theme = AppTheme.light,
  });

  factory ThemeState.initial() {
    return ThemeState();
  }
  @override
  // TODO: implement props
  List<Object?> get props => [theme];

  @override
  bool get stringify => true;

  ThemeState copyWith({
    AppTheme? theme,
  }) {
    return ThemeState(
      theme: theme ?? this.theme,
    );
  }
}
