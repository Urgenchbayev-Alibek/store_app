import '../../core/client.dart';
import '../models/product_model.dart';

class ProductRepository {
  final ApiClient client;

  ProductRepository({required this.client});

  List<ProductsModel> products = [];

  Future<List<ProductsModel>> fetchProducts() async {
    var rawProducts = await client.fetchProductsForHome();
    products = rawProducts.map((e) => ProductsModel.fromJson(e)).toList();
    return products;
  }
}
