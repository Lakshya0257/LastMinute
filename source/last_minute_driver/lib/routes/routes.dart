import 'package:get/get.dart';
import 'package:last_minute_driver/app/modules/after_login/view/after_login.dart';
import 'package:last_minute_driver/app/modules/homePage/view/panelWidgetDriver.dart';
import 'package:last_minute_driver/app/modules/medicalReport/view/medicalReport.dart';

import '../app/modules/createProfile/binding/createProfileDriverBinding.dart';
import '../app/modules/createProfile/binding/createProfileStaffBinding.dart';
import '../app/modules/createProfile/view/createProfileDriver.dart';
import '../app/modules/createProfile/view/createProfileStaff.dart';


import '../app/modules/homePage/binding/homePageDriverBinding.dart';
import '../app/modules/homePage/binding/homePageStaffBinding.dart';
import '../app/modules/homePage/view/homePageDriver.dart';
import '../app/modules/homePage/view/homePageStaff.dart';
import '../app/modules/logIn/binding/loginBinding.dart';
import '../app/modules/logIn/view/login.dart';
import '../app/modules/medicalReport/binding/medicalReportBinding.dart';



class AppRoutes {
  static final pages = [
    GetPage(
      name: LogIn.route,
      page: () => LogIn(),
      binding: LogInBinding(),
    ),
    GetPage(
      name: HomepageDriver.route,
      page: () => HomepageDriver(),
      binding: HomepageDriverBinding(),
    ),
    GetPage(
      name: HomepageStaff.route,
      page: () => HomepageStaff(),
      binding: HomepageStaffBinding(),
    ),
    GetPage(
      name: CreateProfileDriver.route,
      page: () => const CreateProfileDriver(),
      binding: CreateProfileDriverBinding(),
    ),
    GetPage(
      name: CreateProfileStaff.route,
      page: () => const CreateProfileStaff(),
      binding: CreateProfileStaffBinding(),
    ),
   
    GetPage(
      name: MedicalReport.route,
      page: () => MedicalReport(),
      binding: MedicalReportBinding(),
    ),
    GetPage(
      name: LoginAsPage.route,
      page: () => LoginAsPage(),
    ),
    GetPage(name: PanelWidgetDriver.route, page: (() => PanelWidgetDriver()),binding: HomepageDriverBinding()) 
  ];
}
