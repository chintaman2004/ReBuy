import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductController extends GetxController {
  final ApiService api = ApiService();
  final isLoading = false.obs;
  final product = Rxn<Product>();

  Future<void> load(String id) async {
    isLoading.value = true;
    try {
      final data = await api.getProduct(id);
      product.value = Product.fromMap(data);
    } finally {
      isLoading.value = false;
    }
  }
}
