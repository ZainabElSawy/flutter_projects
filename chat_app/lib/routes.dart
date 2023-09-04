import 'package:chat_app/core/constant/routes.dart';
import 'package:chat_app/core/middleware/mymiddleware.dart';
import 'package:chat_app/view/screens/auth/complete_profile.dart';
import 'package:chat_app/view/screens/auth/signup_screen.dart';
import 'package:chat_app/view/screens/auth/success_signup.dart';
import 'package:chat_app/view/screens/home/chat_screen.dart';
import 'package:chat_app/view/screens/home/editcurrentuserprofile.dart';
import 'package:chat_app/view/screens/home/home_screen.dart';
import 'package:chat_app/view/screens/auth/login_screen.dart';
import 'package:chat_app/view/screens/home/profile_sccreen.dart';
import 'package:chat_app/view/screens/onboarding_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  //onBoarding
  GetPage(name: "/", page: () => const OnBoardingScreen(), middlewares: [
    MyMiddleWare(),
  ]),
  //Auth
  GetPage(name: AppRoutes.login, page: () => const LoginScreen()),
  GetPage(name: AppRoutes.signup, page: () => const SignupScreen()),
  GetPage(name: AppRoutes.completeProfile, page: () => const CompleteProfile()),
  GetPage(name: AppRoutes.successSignUp, page: () => const SuccessSignUp()),
  //home screen
  GetPage(name: AppRoutes.home, page: () => const HomeScreen()),
  GetPage(name: AppRoutes.chatScreen, page: () => ChatScreen()),
  GetPage(name: AppRoutes.profileScreen, page: () => ProfileScreen()),
  GetPage(name: AppRoutes.editProfile, page: () => const EditCurrentUserProfile()),
];
