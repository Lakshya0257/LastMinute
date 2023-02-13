// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:last_minute/app/modules/login/controller/login_controller.dart';

class LogInBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => LogInController()
);
  }
}