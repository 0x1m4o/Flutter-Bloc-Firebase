import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/color/color_bloc.dart';
import '../cubits/counter/counter_bloc.dart';


class HomePage extends StatelessWidget {
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    final colorCu = context.read<ColorBloc>();
    final counterCu = context.read<CounterBloc>();
    return BlocListener<ColorBloc, ColorState>(
      listener: (context, state) {
        if (state.color == Colors.red) {
          incrementSize = 1;
        } else if (state.color == Colors.green) {
          incrementSize = 10;
        } else if (state.color == Colors.blue) {
          incrementSize = 100;
        } else if (state.color == Colors.black) {
          incrementSize = -100;
        }
      },
      child: Scaffold(
          backgroundColor: context.watch<ColorBloc>().state.color,
          appBar: AppBar(
            title: Text('Home Page'),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                ElevatedButton(
                    onPressed: () {
                      colorCu.add(ChangeColorEvent());
                    },
                    child: Text('Change Theme')),
                Text(
                  '${context.watch<CounterBloc>().state.counter}',
                  style: TextStyle(color: Colors.white),
                ),
                ElevatedButton(
                    onPressed: () {
                      counterCu.add(ChangeCounterEvent(incrementSize: incrementSize));
                    },
                    child: Text('Increment')),
              ]))),
    );
  }
}
