import 'package:get/get.dart';
import '../../patientDetails/controller/patientDriverController.dart';
import '../controller/homePageDriverController.dart';



class HomepageDriverBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomepageDriverController(),fenix: true);
     Get.lazyPut(() => PatientDetailsDriverController(),fenix: true);
  }
}
