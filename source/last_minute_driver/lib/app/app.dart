import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/app/modules/after_login/view/after_login.dart';
import 'package:last_minute_driver/app/modules/homePage/controller/homePageDriverController.dart';
import 'package:last_minute_driver/app/modules/homePage/controller/homePageStaffController.dart';
import 'package:last_minute_driver/app/modules/homePage/view/homePageDriver.dart';
import 'package:last_minute_driver/app/modules/homePage/view/homePageStaff.dart';
import 'package:last_minute_driver/app/modules/login/controller/loginController.dart';
import 'package:last_minute_driver/app/modules/login/view/login.dart';
import 'package:last_minute_driver/app/modules/patientDetails/controller/patientDriverController.dart';
import 'package:last_minute_driver/app/modules/patientDetails/controller/patientStaffController.dart';
import '../helper/shared_preference.dart';
import '../routes/routes.dart';
import '../utils/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   
    //Get.lazyPut(( ()=>HomepageDriverController()));
    
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lightTheme(context),
      getPages: AppRoutes.pages,
      home: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('bookings').get(),
        builder: ((context, snapshot) {
          List<DocumentSnapshot> patient = [];
          if (snapshot.hasData) {
            final List<DocumentSnapshot> users = snapshot.data!.docs;
            for (var user in users) {
              if (user['ambulanceDetails']['driverId'] ==
                      SPController().getUserId() &&
                  user['ambulanceStatus'] == 'assigned') {
                patient.add(user);
              }
              if(user['emtId']==SPController().getUserId()&& user['ambulanceStatus']=='assigned'){
                patient.add(user);
              }
            }
          }
          // Get.lazyPut(() => HomepageStaffController(),);
          // Get.lazyPut((() => PatientDetailsStaffController()));
          // return HomepageStaff();
          if (SPController().getIsLoggedin()) {
            if (SPController().getLoginType()) {
              if (patient.isNotEmpty) {
                Get.lazyPut(() => HomepageDriverController(),);
                Get.lazyPut((() => PatientDetailsDriverController()));
                return HomepageDriver(
                    patientAssign: true, patient: patient[0]['userId']);
              } else {
                Get.lazyPut(() => HomepageDriverController(),);
                Get.lazyPut(() => PatientDetailsDriverController(),);
                return HomepageDriver();
              }
            } else {
              if(patient.isNotEmpty){
                Get.lazyPut(() => HomepageStaffController(),);
                Get.lazyPut((() => PatientDetailsStaffController()));
                
                return HomepageStaff(patientAssign: true, patientId: patient[0]['userId']);
              }
              else{
                Get.lazyPut(() => HomepageStaffController(),);
                Get.lazyPut((() => PatientDetailsStaffController()));
                
                return HomepageStaff();
              }
            }
          }
          else{
            Get.lazyPut(()=>LogInController(),fenix: true);
            return const LoginAsPage();
          }
        }),
      ),
      // initialRoute:
      //    (SPController().getIsLoggedin()) ? HomepageDriver.route : LogIn.route,
      //HomepageStaff.route,
      //LoginAsPage.route,
    );
  }
}
