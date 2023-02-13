import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute/app/modules/ambulance_details/view/emergency_type_dialog.dart';
import 'package:last_minute/helper/loading.dart';
import 'package:last_minute/helper/shared_preference.dart';
import 'package:last_minute/utils/colors.dart';

class AmbulanceDetailsController extends GetxController {

  TextEditingController preferredHospital=TextEditingController();
  TextEditingController otherEmergencyType=TextEditingController();
  //ambulance details
  RxString dateOfRide = 'Dec 13th 2022, 14:47'.obs;
  RxString rideId = 'LM000000000001'.obs;
  RxString ambulanceNumber = 'XY 19 BP 1111'.obs;

  //driver details
  RxString nameOfDriver = 'Rahul Mahato'.obs;
  RxString phoneNumberOfDriver = ''.obs;

  //nurse details
  RxString nameOfNurse = 'Shilpa'.obs;
  RxString phoneNumberOfNurse = ''.obs;

  //next page
  //final _additionaldata = false.obs;
  bool additionalData=false;

  onPageChanged(bool x) {
    
    additionalData=x;
    update();
    
    
  }
  bool informationUpdated=false;
  onInformationUpdated(bool x)async{
    List<String> emergencyType=[];
    if(breathing){
             emergencyType.add('breathing');
          }
          if(asthmaAttack){
            emergencyType.add('asthmaAttack');
          }
          if(bleeding){
            emergencyType.add('bleeding');
          }
          if(heartAttack){
            emergencyType.add('heartAttack');
          }
          if(otherEmergencyType.text!=''){
            emergencyType.add(otherEmergencyType.text);
          }
    LoadingUtils.showLoader();
    await FirebaseFirestore.instance.collection('bookings').doc(SPController().getUserId()).update({
      'additionalData':{
        'preferredHospital':preferredHospital.text,
        'hospitalType':value,
        'emergencyType':emergencyType
      }
    });
    informationUpdated=x;
    update();
    LoadingUtils.hideLoader();
  }

  //type of hospital
  String value = 'Private and Public';
  List<String> dropDownList = ['Private', 'Public', 'Private and Public'];
  onChangedHospitalType(String x) {
    value = x;
    update();
  }

  //emergency
  bool breathing=false;
  onBreatingChange(bool x){
    breathing=x;
    update();
  }
  bool asthmaAttack=false;
  onAsthmaAttackChanged(bool x){
    asthmaAttack=x;
    update();
  }
  bool bleeding=false;
  onBleedingChanged(bool x){
    bleeding=x;
    update();
  }
  bool heartAttack=false;
  onHeartAttackChanged(bool x){
    heartAttack=x;
    update();
  }
  onOpenEmergency() {
    Get.defaultDialog(
        title: 'EMERGENCY TYPE',
        titleStyle: const TextStyle(color: AppColors.pink, fontFamily: 'RedHatBold'),
        content: const EmergencyTypeDialog());
  }
}
