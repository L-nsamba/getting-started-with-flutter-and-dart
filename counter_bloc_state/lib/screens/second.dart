import 'package:counter_bloc_state/bloc/counter_bloc.dart';
import 'package:counter_bloc_state/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final counterCubit = BlocProvider.of<CounterCubit>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder(
              bloc: counterBloc,
              builder: ((context, state) {
                return Text('$state', style: TextStyle(fontSize: 30));
              }),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
              child: Icon(Icons.skip_previous),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // counterCubit.DecrementCounter();
          counterBloc.add(DecrementValue());
        },
        child: Icon(Icons.minimize),
      ),
    );
  }
}
