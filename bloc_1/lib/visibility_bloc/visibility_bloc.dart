import 'package:bloc_1/Bloc/counter_event.dart';
import 'package:bloc_1/Bloc/counter_state.dart';
import 'package:bloc_1/visibility_bloc/visibility_event.dart';
import 'package:bloc_1/visibility_bloc/visibity_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VisibilityBloc  extends Bloc<VisibilityEvent,VisibityState>{
  VisibilityBloc():super(VisibityState(show: true)){
    on<VisibilityHideEvent>((event, emit) => emit(VisibityState(show: false)),);
    on<VisibilityShowEvent>((event, emit) => emit(VisibityState(show: true)),);

  }

}