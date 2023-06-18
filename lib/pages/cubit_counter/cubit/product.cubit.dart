import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<int> {
  ProductCubit() : super(0);

  inc() => emit(state + 1);
  dec() => emit(state - 1);
}
