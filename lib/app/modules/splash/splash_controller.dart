import 'package:get/get.dart';
import 'package:vakinha_burger/app/core/services/auth_service.dart';

class SplashController extends GetxController { 
  void checkLogged(){
    Get.putAsync(() => AuthService().init());
  }
}