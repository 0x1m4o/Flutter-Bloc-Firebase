import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../blocs/counter/counter_bloc.dart';
import '../blocs/theme/theme_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Home Page'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            HydratedBloc.storage.clear();
          },
          child: Icon(Icons.delete),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('${context.watch<CounterBloc>().state.count}'),
          ElevatedButton(
              onPressed: () =>
                  context.read<ThemeBloc>().add(ToggleThemeEvent()),
              child: Icon(Icons.dark_mode)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(DecrementCounterEvent()),
                  child: Icon(Icons.remove)),
              ElevatedButton(
                  onPressed: () =>
                      context.read<CounterBloc>().add(IncrementCounterEvent()),
                  child: Icon(Icons.add)),
            ],
          )
        ])));
  }
}
