import 'package:get/get.dart';


import '../controller/medicalReportController.dart';

class MedicalReportDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MedicalReportDetailsController());
  }
}
