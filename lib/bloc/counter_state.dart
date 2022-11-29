part of 'counter_bloc.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterSuccess extends CounterState {
  final int counter;

  CounterSuccess(this.counter);
}

class CounterFailure extends CounterState {

  final String error;

  CounterFailure(this.error);

}

