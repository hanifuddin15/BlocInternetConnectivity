import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

part 'internet_connetivity_event.dart';
part 'internet_connetivity_state.dart';

class InternetConnetivityBloc extends Bloc<InternetConnetivityEvent, InternetConnetivityState> {

  Connectivity _connectivity = Connectivity();
   StreamSubscription? _connectivitySubscription;

 // StreamSubscription<>
  InternetConnetivityBloc() : super(InternetConnetivityInitialState()) {
  
     
      on<InternetLostEvent>((event, emit) => emit (InternetConnetivityLostState()));
      on<InternetGainedEvent>((event, emit) => emit (InternetConnetivityGainedState()));
      
  _connectivitySubscription =   _connectivity.onConnectivityChanged.listen((result) {

if ( result == ConnectivityResult.mobile || result == ConnectivityResult.wifi){
  add(InternetGainedEvent());

}
else{
  add(InternetLostEvent());
}
      
     });
   
  }
  @override
  Future<void> close() {
   _connectivitySubscription?.cancel();
    return super.close();
  }
}
