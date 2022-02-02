import 'package:get/get.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repository.dart';
import 'package:vakinha_burger/app/repositories/auth/auth_repositoryImpl.dart';
import 'login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find()),
    );

    Get.lazyPut(
      () => LoginController(authRepository: Get.find()),
    );
  }
}
