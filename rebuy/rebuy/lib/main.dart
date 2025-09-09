import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'src/routes/app_pages.dart';
import 'src/routes/app_routes.dart';
import 'src/ui/theme/app_theme.dart';

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
      theme: AppTheme.theme,
      initialRoute: Routes.splash,
      getPages: AppPages.pages,
    );
  }
}
