import 'package:chat_app/core/constant/routes.dart';
import 'package:get/get.dart';

abstract class SuccessSigupController extends GetxController {
  goToLogin();
}

class SuccessSigupControllerImp extends SuccessSigupController {
  @override
  goToLogin() {
    Get.offNamed(AppRoutes.login);
  }
}
