import 'package:get/get.dart';
import 'package:vakinha_burger/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burger/app/modules/auth/register/register_page.dart';

class AuthRoutes {
  AuthRoutes._();

  static final routers = <GetPage>[
    GetPage(name: '/auth/login', page: () => const LoginPage()),
    GetPage(name: '/auth/register', page: () => const RegisterPage()),
  ];
}
