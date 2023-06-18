part of 'api.bloc.dart';

abstract class ProductState extends Equatable {
  @override
  List<Object> get props => [];
}

class InitialState extends ProductState {}

class LoadingState extends ProductState {}

class LoadedState extends ProductState {
  final List<Post> post;
  LoadedState(this.post);
}

class ErrorState extends ProductState {}
