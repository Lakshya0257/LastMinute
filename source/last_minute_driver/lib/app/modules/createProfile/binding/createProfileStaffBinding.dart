// ignore_for_file: file_names

import 'package:get/get.dart';

import '../controller/createProfileStaffController.dart';

class CreateProfileStaffBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => CreateProfileStaffController()
);
  }
}