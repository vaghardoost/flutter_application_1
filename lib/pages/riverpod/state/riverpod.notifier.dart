import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model.dart';

part 'riverpod.state.dart';

part 'riverpod.provider.dart';

class RiverpodNotifier extends ChangeNotifier {
  RiverpodState state = InitialState();

  getData() async {
    state = LoadingState();
    await Future.delayed(const Duration(seconds: 1));
    state = LoadedState([
      RiverpodModel(10000, 'ali', 'img_0001.jpg', false),
      RiverpodModel(10001, 'javad', 'img_0002.jpg', false),
      RiverpodModel(10002, 'hasan', 'img_0003.jpg', false),
      RiverpodModel(10003, 'reza', 'img_0004.jpg', false),
      RiverpodModel(10004, 'mohsen', 'img_0005.jpg', false),
      RiverpodModel(10005, 'parviz', 'img_0006.jpg', false),
      RiverpodModel(10006, 'elnaz', 'img_0007.jpg', false),
      RiverpodModel(10007, 'shohre', 'img_0008.jpg', false),
      RiverpodModel(10008, 'paria', 'img_0009.jpg', false),
      RiverpodModel(10009, 'maryam', 'img_0010.jpg', false),
    ]);
    notifyListeners();
  }

  faveItem(int index) {
    final list = (state as LoadedState).list;
    list[index].fav = !list[index].fav;
    state = LoadedState(list);
    notifyListeners();
  }

  faveItemById(int id) {
    final list = (state as LoadedState).list;
    for (var element in list) {
      if (element.id == id) {
        element.fav = !element.fav;
        notifyListeners();
        return;
      }
    }
  }
}
