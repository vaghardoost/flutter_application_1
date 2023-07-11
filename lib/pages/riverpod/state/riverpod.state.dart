part of 'riverpod.notifier.dart';

abstract class RiverpodState {}

class InitialState extends RiverpodState {}

class LoadingState extends RiverpodState {}

class LoadedState extends RiverpodState {
  final List<RiverpodModel> list;
  
  LoadedState(this.list);
}

class ErrorState extends RiverpodState {
  final String error;

  ErrorState(this.error);
}
