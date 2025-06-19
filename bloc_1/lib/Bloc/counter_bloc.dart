import 'package:bloc_1/Bloc/counter_event.dart';
import 'package:bloc_1/Bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc  extends Bloc<CounterEvent,CounterState>{
  CounterBloc():super(CounterState(count: 0)){
    on<CounterEvent>((event, emit) => emit(CounterState(count: state.count+1)),);

  }

}