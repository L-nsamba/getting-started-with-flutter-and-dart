import 'package:counter_bloc_state/bloc/counter_bloc.dart';
import 'package:counter_bloc_state/cubit/counter_cubit.dart';
import 'package:counter_bloc_state/screens/home.dart';
import 'package:counter_bloc_state/screens/second.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final counterCubit = CounterCubit();
    final counterBloc = CounterBloc();

    return MultiBlocProvider(
      providers: [BlocProvider(create: (context) => CounterCubit())],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => BlocProvider.value(
            value: counterBloc,
            child: const MyHomePage(),
          ),
          '/second': (context) => BlocProvider.value(
            value: counterBloc,
            child: const SecondPage(),
          ),
        },
      ),
    );
  }
}
