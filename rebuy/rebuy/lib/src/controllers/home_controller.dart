import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  final ApiService api = ApiService();
  final products = <Product>[].obs;
  final isLoading = false.obs;
  final error = RxnString();

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    isLoading.value = true;
    error.value = null;
    try {
      final data = await api.getProducts();
      products.assignAll(data.map((e) => Product.fromMap(e)).toList());
      // ignore: avoid_print
      print('Loaded ${products.length} products');
    } catch (e) {
      error.value = e.toString();
      // ignore: avoid_print
      print('Fetch error: $e');
    } finally {
      isLoading.value = false;
    }
  }
}
