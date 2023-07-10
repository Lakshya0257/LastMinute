import 'package:get/get.dart';

import '../modules/homeScreen/binding/homePageBinding.dart';
import '../modules/homeScreen/view/homePage.dart';
import '../modules/loginScreen/binding/loginBinding.dart';
import '../modules/loginScreen/view/loginPage.dart';
import '../modules/medicalReportDetailsScreen/binding/medicalReportBinding.dart';
import '../modules/medicalReportDetailsScreen/view/medicalReportDetails.dart';




class AppRoutes {
  static final pages = [
    GetPage(
      name: LoginPage.route,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: HomePage.route,
      page: () => const HomePage(),
      binding: HomePageBinding(),
    ),
    
    GetPage(
      name: MedicalReportDetails.route,
      page: () => const MedicalReportDetails(),
      binding: MedicalReportDetailsBinding(),
    ),
    // GetPage(
    //   name: HomepageStaff.route,
    //   page: () => HomepageStaff(),
    //   binding: HomepageStaffBinding(),
    // ),
    // GetPage(
    //   name: CreateProfileDriver.route,
    //   page: () => const CreateProfileDriver(),
    //   binding: CreateProfileDriverBinding(),
    // ),
    // GetPage(
    //   name: CreateProfileStaff.route,
    //   page: () => const CreateProfileStaff(),
    //   binding: CreateProfileStaffBinding(),
    // ),
    // GetPage(
    //   name: FirstPage.route,
    //   page: () => FirstPage(),
    // ),
    // GetPage(
    //   name: MedicalReport.route,
    //   page: () => MedicalReport(),
    //   binding: MedicalReportBinding(),
    // ),

  ];
}
