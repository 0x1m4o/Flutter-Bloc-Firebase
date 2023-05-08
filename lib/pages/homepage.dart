import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/theme_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeCu = context.read<ThemeBloc>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          actions: [
            BlocBuilder<ThemeBloc, ThemeState>(
              builder: (context, state) {
                return IconButton(
                    onPressed: () {
                      final isDark;
                      if (state.theme == AppTheme.light) {
                        isDark = false;
                      } else {
                        isDark = true;
                      }
                      themeCu.add(ChangeThemeEvent(isDark: isDark));
                      print(isDark);
                    },
                    icon: Icon(Icons.light_mode));
              },
            ),
          ],
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return Text('method : BlocBuilder ${state.theme}');
            },
          ),
        ])));
  }
}
