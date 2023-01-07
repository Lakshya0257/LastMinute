import 'package:get/get.dart';
import 'package:last_minute_admin_panel/modules/homeScreen/controller/homePageController.dart';

class HomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomePageController());
  }
}
