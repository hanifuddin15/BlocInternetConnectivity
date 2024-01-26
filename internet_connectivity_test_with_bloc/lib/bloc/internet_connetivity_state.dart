part of 'internet_connetivity_bloc.dart';

@immutable
sealed class InternetConnetivityState {}

final class InternetConnetivityInitialState extends InternetConnetivityState {}


final class InternetConnetivityLostState extends InternetConnetivityState {}


final class InternetConnetivityGainedState extends InternetConnetivityState {}
