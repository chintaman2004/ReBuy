import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/home_controller.dart';
import '../../routes/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        actions: [
          IconButton(onPressed: ()=>Get.toNamed(Routes.messages), icon: const Icon(Icons.message_outlined)),
          IconButton(onPressed: ()=>Get.toNamed(Routes.sidebar), icon: const Icon(Icons.menu)),
        ],
      ),
      body: Obx(() {
        if (c.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.separated(
          padding: const EdgeInsets.all(12),
          itemCount: c.products.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (ctx, i) {
            final p = c.products[i];
            return Card(
              child: ListTile(
                leading: const CircleAvatar(child: Icon(Icons.image)),
                title: Text(p.title),
                subtitle: Text(p.description, maxLines: 1, overflow: TextOverflow.ellipsis),
                trailing: Text('Rs ${p.price.toStringAsFixed(0)}'),
                onTap: () => Get.toNamed(Routes.product, arguments: p.id),
              ),
            );
          },
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        onTap: (i) {},
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Liked'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Account'),
        ],
      ),
    );
  }
}
