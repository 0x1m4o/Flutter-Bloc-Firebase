import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './pages/counter.dart';
import './pages/homepage.dart';
import './cubit/counter_cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit counterCubit = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        '/': (context) => BlocProvider.value(
              value: counterCubit,
              child: HomePage(),
            ),
        '/counter': (context) => BlocProvider.value(
              value: counterCubit,
              child: const CounterPage(),
            )
      },
    );
  }

  @override
  void dispose() {
    counterCubit.close();
    super.dispose();
  }
}
