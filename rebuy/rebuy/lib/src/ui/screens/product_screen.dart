import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/product_controller.dart';
import '../../routes/app_routes.dart';
import '../theme/app_theme.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final id = Get.arguments?.toString() ?? '';
    final c = Get.put(ProductController())..load(id);

    return Scaffold(
      appBar: AppBar(title: const Text('Product', style: TextStyle(fontWeight: FontWeight.w700))),
      body: Obx(() {
        if (c.isLoading.value || c.product.value == null) return const Center(child: CircularProgressIndicator());
        final p = c.product.value!;
        return ListView(
          padding: const EdgeInsets.all(G.pad),
          children: [
            Container(
              height: 220,
              decoration: BoxDecoration(color: AppColors.card, borderRadius: G.r20, border: Border.all(color: AppColors.stroke)),
              child: const Center(child: Icon(Icons.image, size: 48)),
            ),
            const SizedBox(height: 12),
            Text(p.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
            const SizedBox(height: 4),
            Text('Rs ${p.price.toStringAsFixed(0)}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
            const SizedBox(height: 8),
            Text(p.description, style: const TextStyle(color: AppColors.subtext)),
            const SizedBox(height: 20),
            PinkButton(text: 'Buy now', onPressed: ()=>Get.toNamed(Routes.purchase, arguments: p.id)),
          ],
        );
      }),
    );
  }
}
