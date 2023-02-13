import 'package:get/get.dart';
import 'package:last_minute/app/modules/ambulance_details/controller/ambulance_controller.dart';
import 'package:last_minute/app/modules/homepage/controller/homepage_controller.dart';

class HomepageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomepageController());
    Get.lazyPut(() => AmbulanceDetailsController());
  }
}
