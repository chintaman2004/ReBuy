import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class ListingsScreen extends StatelessWidget {
  const ListingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Listings', style: TextStyle(fontWeight: FontWeight.w700))),
      body: ListView.separated(
        padding: const EdgeInsets.all(G.pad),
        itemBuilder: (_, i) => const CardTile(child: ListTile(leading: Icon(Icons.store_mall_directory_outlined), title: Text('Listing'), subtitle: Text('Active'), trailing: Icon(Icons.edit_outlined))),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: 4,
      ),
    );
  }
}
