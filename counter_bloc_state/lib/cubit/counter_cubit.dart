import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void IncrementCounter() {
    emit(state + 1);
  }

  void DecrementCounter() {
    emit(state - 1);
  }
}
