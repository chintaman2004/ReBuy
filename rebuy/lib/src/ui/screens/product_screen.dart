import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import '../../routes/app_routes.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments?.toString() ?? '';
    final c = Get.put(ProductController())..load(id);

    return Scaffold(
      appBar: AppBar(title: const Text('Product')),
      body: Obx(() {
        if (c.isLoading.value || c.product.value == null) {
          return const Center(child: CircularProgressIndicator());
        }
        final p = c.product.value!;
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AspectRatio(aspectRatio: 16/9, child: Placeholder()),
              const SizedBox(height: 12),
              Text(p.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text('Rs ${p.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18)),
              const SizedBox(height: 8),
              Text(p.description),
              const Spacer(),
              FilledButton(
                onPressed: ()=>Get.toNamed(Routes.purchase, arguments: p.id),
                child: const Text('Buy now'),
              )
            ],
          ),
        );
      }),
    );
  }
}
