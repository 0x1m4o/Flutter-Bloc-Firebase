import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/counter_cubit.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final counterCu = BlocProvider.of<CounterCubit>(context);

    // Above same as Below

    final counterCu = context.read<CounterCubit>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Set the listen to true so you can mantain the changes value.
            Text(
                'method : listen: true ${BlocProvider.of<CounterCubit>(context, listen: true).state.counter}'),

            // Or

            // Use the BlocBuilder to create an area that listen to changes.

            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text('method : BlocBuilder ${state.counter}');
              },
            ),

            // OR

            // You can use BlocListener to create an another action.
            // Example if the current value is 5 the UI will display the message -
            // that the value is max and etc

            BlocListener<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.counter == 5) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Your value is reach (${state.counter})'),
                      );
                    },
                  );
                } else if (state.counter == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Your value is reach (${state.counter})'),
                      );
                    },
                  );
                }
              },
              child: BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                      'method : BlocBuilder wrapped with BlocListener ${state.counter}');
                },
              ),
            ),

            // OR

            // The simple ways to make it listener and builder is using -
            // BlocConsumer because in the BlocConsumer widget it has listener -
            // and builder.
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context, state) {
                if (state.counter == 5) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Your value is reach (${state.counter})'),
                      );
                    },
                  );
                } else if (state.counter == 0) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text('Your value is reach (${state.counter})'),
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                return Text('method : BlocConsumer ${state.counter}');
              },
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                    onPressed: () => counterCu.decrement(),
                    child: Icon(Icons.remove)),
                OutlinedButton(
                    onPressed: () => counterCu.increment(),
                    child: Icon(Icons.add))
              ],
            )
          ],
        ),
      ),
    );
  }
}
