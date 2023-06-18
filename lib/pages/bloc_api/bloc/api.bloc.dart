import 'package:flutter_application_1/pages/bloc_api/model.dart';
import 'package:flutter_application_1/utils/api.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'api.event.dart';
part 'api.state.dart';

class ApiBloc extends Bloc<ApiBlocEvent, ProductState> {
  ApiBloc() : super(InitialState()) {
    final api = GetIt.I.get<Api>();
    on((event, emit) async {
      switch (event) {
        case ApiBlocEvent.getdata:
          emit(LoadingState());
          List<Post> post = await api.getList();
          emit(LoadedState(post));
          break;
      }
    });
  }

}
