import 'package:store_app/core/client.dart';

import '../models/category_model.dart';

class SearchRepository{
  SearchRepository({required this.client});
  final ApiClient client;

  List<CategoryModel> categories = [];

  Future<List<CategoryModel>> getSearchResult(String title) async{
    var response = await client.genericGetRequest<List<dynamic>>('/products/list?Title=$title');
    categories = response.map((category) => CategoryModel.fromJson(category)).toList();
    return categories;
  }
}