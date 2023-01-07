// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:last_minute_driver/app/modules/homePage/controller/homePageStaffController.dart';

import '../controller/medicalReportController.dart';


class MedicalReportBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => MedicalReportController());
    Get.lazyPut(() => HomepageStaffController());

  }
}