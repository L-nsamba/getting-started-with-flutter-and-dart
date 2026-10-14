import 'package:bloc/bloc.dart';

abstract class CounterEvent {}

class IncrementValue extends CounterEvent {}

class DecrementValue extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<IncrementValue>((event, emit) {
      emit(state + 1);
    });

    on<DecrementValue>((event, emit) {
      emit(state - 1);
    });
  }
}
