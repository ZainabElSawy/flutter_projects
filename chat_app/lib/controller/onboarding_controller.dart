import 'package:chat_app/core/constant/routes.dart';
import 'package:chat_app/core/services/services.dart';
import 'package:get/get.dart';

abstract class OnBoardingController extends GetxController {
  goToLogin();
}

class OnBoardingControllerImp extends OnBoardingController {
  MyServices myServices = Get.find();
  @override
  goToLogin() {
    myServices.sharedPreferences?.setString("onboarding", "1");
    Get.offNamed(AppRoutes.login);
  }
}
