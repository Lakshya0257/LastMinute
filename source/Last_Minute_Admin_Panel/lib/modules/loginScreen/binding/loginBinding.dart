import 'package:get/get.dart';
import 'package:last_minute_admin_panel/modules/loginScreen/controller/loginController.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
