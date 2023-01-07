// ignore_for_file: file_names

import 'package:get/get.dart';

import '../controller/loginController.dart';

class LogInBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => LogInController(),fenix: true
);
  }
}