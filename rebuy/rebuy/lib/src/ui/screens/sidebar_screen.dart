import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../theme/app_theme.dart';

class SidebarScreen extends StatelessWidget {
  const SidebarScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final items = [
      ['Home', Routes.home, Icons.home_outlined],
      ['My Listings', Routes.listings, Icons.storefront_outlined],
      ['Orders', Routes.orders, Icons.receipt_long_outlined],
      ['Settings', Routes.account, Icons.settings_outlined],
    ];
    return Scaffold(
      appBar: AppBar(title: const Text('Menu', style: TextStyle(fontWeight: FontWeight.w700))),
      body: Padding(
        padding: const EdgeInsets.all(G.pad),
        child: Column(
          children: [
            for (var it in items) ...[
              CardTile(child: ListTile(leading: Icon(it[2] as IconData), title: Text(it[0] as String), trailing: const Icon(Icons.chevron_right), onTap: ()=>Get.toNamed(it[1] as String))),
              const SizedBox(height: 10),
            ]
          ],
        ),
      ),
    );
  }
}
