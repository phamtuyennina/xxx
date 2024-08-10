import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../core/app_setttings/app_setting_provider.dart';
import '../core/authentication_user/providers/auth_user_provider.dart';
import '../features/account/account_screen.dart';
import '../features/account/address/address_screen.dart';
import '../features/account/address/address_detail_screen.dart';
import '../features/account/language/language_screen.dart';
import '../features/account/support/support_screen.dart';
import '../features/favorite/favorite_screen.dart';
import '../features/forgot_password/forgot_password_screen.dart';
import '../features/home/home_screen.dart';
import '../features/intro_auth/intro_auth_screen.dart';
import '../features/main_layout.dart';
import '../features/news/news_detail_screen.dart';
import '../features/news/news_screen.dart';
import '../features/notification/notification_screen.dart';
import '../features/onboarding/onboarding_screen.dart';
import '../features/order/order_detail_screen.dart';
import '../features/order/order_screen.dart';
import '../features/payment/doi_dia_chi_screen.dart';
import '../features/payment/payment_screen.dart';
import '../features/payment/phuong_thuc_van_chuyen_screen.dart';
import '../features/product_category/product_category_screen.dart';
import '../features/product_detail/product_detail_screen.dart';
import '../features/products/products_screen.dart';
import '../features/profile/profile_screen.dart';
import '../features/reviews_product/add_review_product.dart';
import '../features/reviews_product/reviews_product_screen.dart';
import '../features/search_products/search_product_screen.dart';
import '../features/shopping_cart/shopping_cart_screen.dart';
import '../features/sign_in/sign_in_screen.dart';
import '../features/sign_up/sign_up_screen.dart';
import '../features/splash/splash_screen.dart';
import '../features/stores/stores_screen.dart';
import '../shared/app_config.dart';
import '../shared/common_widgets/error_404_widget.dart';

part 'routes.dart';
part 'app_router_notifier.dart';

final _routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

final routerProvider = Provider<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  final loadOnboarding =
      ref.watch(appSettingProvider.select((value) => value.onboarding));

  return GoRouter(
    navigatorKey: _routerKey,
    debugLogDiagnostics: !AppConfig.production,
    initialLocation:
        (loadOnboarding == false && AppConfig.pathOnboarding.isNotEmpty)
            ? AppConfig.pathOnboarding
            : AppConfig.initialPath,
    refreshListenable: notifier,
    routes: _danhsachRoute,
    redirect: notifier.redirect,
    errorPageBuilder: (context, state) =>
        _effectTransitionFade(context, state, const Error404Widget()),
  );
});
