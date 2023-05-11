import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_firebase/cubit/counter_cubit.dart';
import 'package:flutter_bloc_firebase/pages/counter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) {
                    return BlocProvider.value(
                      value: BlocProvider.of<CounterCubit>(context),
                      child: CounterPage(),
                    );
                  },
                ));
              },
              child: Text('Go To Counter Page')),
          ElevatedButton(
              onPressed: () =>
                  BlocProvider.of<CounterCubit>(context).increment(),
              child: Text('Increment the counter value')),
        ])));
  }
}
