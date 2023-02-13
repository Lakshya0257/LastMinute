import 'package:get/get.dart';

import 'package:last_minute/app/modules/create_profile/binding/create_profile_binding.dart';
import 'package:last_minute/app/modules/create_profile/view/create_profile.dart';

import 'package:last_minute/app/modules/before_login/view/before_login.dart';

import 'package:last_minute/app/modules/homepage/binding/homepage_binding.dart';
import 'package:last_minute/app/modules/homepage/view/homepage.dart';
import 'package:last_minute/app/modules/login/binding/logIn_binding.dart';
import 'package:last_minute/app/modules/login/view/login.dart';

class AppRoutes {
  static final pages = [
    GetPage(
      name: LogIn.route,
      page: () => const LogIn(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: Homepage.route,
      page: () => Homepage(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: CreateProfile.route,
      page: () => const CreateProfile(),
      binding: CreateProfileBinding(),
    ),
    GetPage(
      name: FirstPage.route,
      page: () => const FirstPage(),
    ),
  ];
}
