import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial()) {
    var counter = 0;

    on<IncrementEvent>((event, emit) {
      // TODO: implement event handler
      counter++;
      emit(CounterSuccess(counter));
    });
    on<DecrementEvent>((event, emit) {
      // TODO: implement event handler
      if (counter == 0) {
        emit(CounterFailure("yavaş"));
      } else {
        counter--;
        emit(CounterSuccess(counter));
      }
    });
  }
}
