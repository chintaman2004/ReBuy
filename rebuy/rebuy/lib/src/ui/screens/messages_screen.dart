import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Messages', style: TextStyle(fontWeight: FontWeight.w700))),
      body: ListView.separated(
        padding: const EdgeInsets.all(G.pad),
        itemBuilder: (_, i) {
          return CardTile(
            child: ListTile(
              leading: CircleAvatar(child: Text('${i+1}')),
              title: Text('Buyer ${i+1}', style: const TextStyle(fontWeight: FontWeight.w700)),
              subtitle: const Text('Hey! Is this still available?'),
              trailing: const Icon(Icons.chevron_right),
            ),
          );
        },
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: 10,
      ),
    );
  }
}
