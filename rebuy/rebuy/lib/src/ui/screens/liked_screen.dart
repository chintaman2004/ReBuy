import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class LikedScreen extends StatelessWidget {
  const LikedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Liked it', style: TextStyle(fontWeight: FontWeight.w700))),
      body: ListView.separated(
        padding: const EdgeInsets.all(G.pad),
        itemBuilder: (_, i) => const CardTile(child: ListTile(leading: Icon(Icons.favorite, color: AppColors.pinkDark), title: Text('Saved item'), trailing: Icon(Icons.chevron_right))),
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemCount: 6,
      ),
    );
  }
}
