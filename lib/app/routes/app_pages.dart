// ignore_for_file: constant_identifier_names

import 'package:ecommerce_app/app/modules/all_products/bindings/all_products_binding.dart';
import 'package:ecommerce_app/app/modules/all_products/views/all_produts_screen.dart';
import 'package:ecommerce_app/app/modules/cart/bindings/cart_binding.dart';
import 'package:ecommerce_app/app/modules/cart/views/cart.dart';
import 'package:ecommerce_app/app/modules/checkout/bindings/checkout_binding.dart';
import 'package:ecommerce_app/app/modules/checkout/views/checkout.dart';
import 'package:ecommerce_app/app/modules/product_view/bindings/product_view_binding.dart';
import 'package:ecommerce_app/app/modules/product_view/views/product_view.dart';

import '../modules/categories/bindings/categories_binding.dart';
import '../modules/categories/views/categories_screen.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashborad_screen.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_screen.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_screen.dart';
// import '../modules/notification/bindings/notification_binding.dart';
// import '../modules/notification/views/notification_screen.dart';
import '../modules/orders/bindings/order_binding.dart';
import '../modules/orders/views/order_screen.dart';
import '../modules/products/bindings/products_binding.dart';
import '../modules/products/views/products_screen.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_screen.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_screen.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_screen.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_screen.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();
  static const INITIAL = AppRoutes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: AppRoutes.SPLASH_SCREEN,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginScreen(),
        binding: LoginBinding()),
    GetPage(
        name: AppRoutes.FORGOT_PASSWORD,
        page: () => ForgotPasswordScreen(),
        binding: ForgotPasswordBinding()),
    GetPage(
        name: AppRoutes.REGISTER,
        page: () => RegisterScreen(),
        binding: RegisterBinding()),
    GetPage(
        name: AppRoutes.DASHBOARD,
        page: () => DashboradScreen(),
        binding: DashboardBinding()),
    GetPage(
      name: AppRoutes.HOME,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //     name: AppRoutes.NOTIFICATION,
    //     page: () => NotificationScreen(),
    //     binding: NotificationBinding()),
    GetPage(
        name: AppRoutes.ORDER,
        page: () => OrderScreen(),
        binding: OrderBinding()),
    GetPage(
        name: AppRoutes.PROFILE,
        page: () => ProfileScreen(),
        binding: ProfileBinding()),
    GetPage(
        name: AppRoutes.CATEGORIES,
        page: () => CategoriesScreen(),
        binding: CategoriesBinding()),
    GetPage(
        name: AppRoutes.PRODUCTS,
        page: () => ProductsScreen(),
        binding: ProductsBinding()),
    GetPage(
        name: AppRoutes.AllPRODUCTS,
        page: () => AllProdutsScreen(),
        binding: AllProductsBinding()),
    GetPage(
        name: AppRoutes.PRODUCTVIEW,
        page: () => ProductView(),
        binding: ProductViewBinding()),
    GetPage(
        name: AppRoutes.CART,
        page: () => Cart(),
        binding: CartBinding()),
    GetPage(
        name: AppRoutes.CHECKOUT,
        page: () => Checkout(),
        binding: CheckoutBinding())
  ];
}
