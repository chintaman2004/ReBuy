import 'package:get/get.dart';
import '../ui/screens/splash_screen.dart';
import '../ui/screens/signup_screen.dart';
import '../ui/screens/login_screen.dart';
import '../ui/screens/home_screen.dart';
import '../ui/screens/messages_screen.dart';
import '../ui/screens/sidebar_screen.dart';
import '../ui/screens/account_screen.dart';
import '../ui/screens/product_screen.dart';
import '../ui/screens/liked_screen.dart';
import '../ui/screens/listings_screen.dart';
import '../ui/screens/orders_screen.dart';
import '../ui/screens/purchase_screen.dart';
import '../ui/screens/payment_screen.dart';
import '../ui/screens/confirmation_screen.dart';
import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(name: Routes.splash, page: () => const SplashScreen()),
    GetPage(name: Routes.signup, page: () => const SignupScreen()),
    GetPage(name: Routes.login, page: () => const LoginScreen()),
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.messages, page: () => const MessagesScreen()),
    GetPage(name: Routes.sidebar, page: () => const SidebarScreen()),
    GetPage(name: Routes.account, page: () => const AccountScreen()),
    GetPage(name: Routes.product, page: () => const ProductScreen()),
    GetPage(name: Routes.liked, page: () => const LikedScreen()),
    GetPage(name: Routes.listings, page: () => const ListingsScreen()),
    GetPage(name: Routes.orders, page: () => const OrdersScreen()),
    GetPage(name: Routes.purchase, page: () => const PurchaseScreen()),
    GetPage(name: Routes.payment, page: () => const PaymentScreen()),
    GetPage(name: Routes.confirmation, page: () => const ConfirmationScreen()),
  ];
}
