import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase/cubits/color/color_cubit.dart';
import 'package:flutter_bloc_firebase/cubits/counter/counter_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorCu = context.read<ColorCubit>();
    final counterCu = context.read<CounterCubit>();
    return Scaffold(
        backgroundColor: context.watch<ColorCubit>().state.color,
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                counterCu.changeCounter();
              },
              child: Text('Increment')),
        ])));
  }
}
