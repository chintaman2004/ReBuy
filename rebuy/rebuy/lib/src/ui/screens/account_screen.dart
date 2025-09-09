import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('My Account',
              style: TextStyle(fontWeight: FontWeight.w700))),
      body: const Padding(
        padding: EdgeInsets.all(G.pad),
        child: Column(
          children: [
            CardTile(
                child: ListTile(
                    title: Text('Profile'),
                    trailing: Icon(Icons.chevron_right))),
            SizedBox(height: 10),
            CardTile(
                child: ListTile(
                    title: Text('Addresses'),
                    trailing: Icon(Icons.chevron_right))),
            SizedBox(height: 10),
            CardTile(
                child: ListTile(
                    title: Text('Payment Methods'),
                    trailing: Icon(Icons.chevron_right))),
          ],
        ),
      ),
    );
  }
}
