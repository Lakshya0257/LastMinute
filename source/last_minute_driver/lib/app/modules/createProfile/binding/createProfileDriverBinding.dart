// ignore_for_file: file_names

import 'package:get/get.dart';


import '../controller/createProfileDriverController.dart';

class CreateProfileDriverBinding implements Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => CreateProfileDriverController(),);
  }
}