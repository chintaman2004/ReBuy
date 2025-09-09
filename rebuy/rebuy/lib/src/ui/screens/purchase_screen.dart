import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import '../theme/app_theme.dart';

class PurchaseScreen extends StatelessWidget {
  const PurchaseScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Purchase Summary',
              style: TextStyle(fontWeight: FontWeight.w700))),
      body: const Padding(
        padding: EdgeInsets.all(G.pad),
        child: Column(
          children: [
            CardTile(
                child: ListTile(
                    title: Text('Lagoon Polo Shirt'),
                    trailing: Text('Rs 995'))),
            SizedBox(height: 10),
            CardTile(
                child:
                    ListTile(title: Text('Shipping'), trailing: Text('Rs 0'))),
            SizedBox(height: 10),
            CardTile(
                child: ListTile(
                    title: Text('Total'),
                    trailing: Text('Rs 995',
                        style: TextStyle(fontWeight: FontWeight.w700)))),
            Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(G.pad),
        child: PinkButton(
            text: 'Proceed to Payment',
            onPressed: () => Get.toNamed(Routes.payment)),
      ),
    );
  }
}
