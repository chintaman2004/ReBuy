import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/routes/app_pages.dart';
import 'src/routes/app_routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const RebuyApp());
}

class RebuyApp extends StatelessWidget {
  const RebuyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ReBuy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: const Color(0xFFFD5F7C),
        scaffoldBackgroundColor: const Color(0xFFF7F7F7),
        fontFamily: 'Roboto',
      ),
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
  }
}
