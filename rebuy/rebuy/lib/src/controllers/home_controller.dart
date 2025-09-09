import 'package:get/get.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class HomeController extends GetxController {
  final ApiService api = ApiService();
  final products = <Product>[].obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetch();
  }

  Future<void> fetch() async {
    isLoading.value = true;
    try {
      final data = await api.getProducts();
      products.assignAll(data.map((e) => Product.fromMap(e)).toList());
    } finally {
      isLoading.value = false;
    }
  }
}
