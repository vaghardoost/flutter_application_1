import 'package:dio/dio.dart';
import 'package:flutter_application_1/pages/bloc_api/model.dart';

class Api {
  static const _list = "https://fakestoreapi.com/products";
  final _api = Dio();

  Future<List<Post>> getList() async {
    final response = await _api.get<List>(_list);
    if (response.statusCode == 200) {
      return response.data!.map((e) {
        return Post.fromJson(e);
      }).toList();
    }
    return [];
  }
}
