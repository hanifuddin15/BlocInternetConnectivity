part of 'internet_connetivity_bloc.dart';

@immutable
sealed class InternetConnetivityEvent {}

class InternetLostEvent extends InternetConnetivityEvent{

}

class InternetGainedEvent extends InternetConnetivityEvent{}
