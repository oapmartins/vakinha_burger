import 'package:get/route_manager.dart';
import 'package:vakinha_burger/app/modules/splash/splash_bindings.dart';
import 'package:vakinha_burger/app/modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      binding: SplashBindings(),
      page: () => const SplashPage(),
    )
  ];
}
