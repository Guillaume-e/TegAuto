import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CounterEvent {}

class CounterIncrementPressed extends CounterEvent {}

class CounterDecrementPressed extends CounterEvent {}

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0) {
    on<CounterIncrementPressed>(
      (CounterIncrementPressed event, Emitter<int> emit) => emit(state + 1),
    );
    on<CounterDecrementPressed>(
      (CounterDecrementPressed event, Emitter<int> emit) => emit(state - 1),
    );
  }
}
