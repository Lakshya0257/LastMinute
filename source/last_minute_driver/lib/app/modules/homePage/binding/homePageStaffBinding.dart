// ignore_for_file: file_names, unused_import

import 'package:get/get.dart';
import '../../medicalReport/controller/medicalReportController.dart';
import '../../patientDetails/controller/patientStaffController.dart';
import '../controller/homePageStaffController.dart';



class HomepageStaffBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomepageStaffController(),fenix: true);
   Get.lazyPut(() => PatientDetailsStaffController(),fenix: true);
  }
}
