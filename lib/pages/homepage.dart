import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/color/color_cubit.dart';
import '../cubits/counter/counter_cubit.dart';

class HomePage extends StatelessWidget {
  int incrementSize = 1;
  @override
  Widget build(BuildContext context) {
    final colorCu = context.read<ColorCubit>();
    final counterCu = context.read<CounterCubit>();
    return BlocListener<ColorCubit, ColorState>(
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
          backgroundColor: context.watch<ColorCubit>().state.color,
          appBar: AppBar(
            title: Text('Home Page'),
          ),
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                ElevatedButton(
                    onPressed: () {
                      colorCu.changeColor();
                    },
                    child: Text('Change Theme')),
                Text(
                  '${context.watch<CounterCubit>().state.count}',
                  style: TextStyle(color: Colors.white),
                ),
                ElevatedButton(
                    onPressed: () {
                      counterCu.changeCounter(incrementSize);
                    },
                    child: Text('Increment')),
              ]))),
    );
  }
}
