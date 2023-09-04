import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyServices extends GetxService {
  SharedPreferences? sharedPreferences;
  Future<MyServices> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

initialServices() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Get.putAsync(() => MyServices().init());
}
