import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/helper/loading.dart';
import 'package:last_minute_driver/helper/shared_preference.dart';
import 'package:last_minute_driver/helper/snackbar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../../../widgets/button.dart';
import '../controller/homePageDriverController.dart';
import '../controller/homePageStaffController.dart';



class PanelWidgetStaff extends GetView<HomepageStaffController> {
  var data = [];
  PanelWidgetStaff({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController Ikey=TextEditingController();
    return Padding(
      padding: EdgeInsets.fromLTRB(Dimensions.width15, Dimensions.height10,
          Dimensions.width15, Dimensions.height30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
                    width: Dimensions.width20 * 4,
                    height: Dimensions.height10 / 5,
                    decoration: BoxDecoration(
                        color: AppColors.lightGrey,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
        
         
          
          Center(child: BigText(text: 'Enter Driver\'s ID', fontWeight: FontWeight.bold,)),

          
SizedBox(
            height: Dimensions.height40*1.75,
            child: Container(
      margin: EdgeInsets.only(top: Dimensions.height20, left: Dimensions.width40, right: Dimensions.width40 ),
      child: Material(
        elevation: Dimensions.height10/2,
        borderRadius: BorderRadius.circular(Dimensions.radius30),
        child: TextField(
          controller: Ikey,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: Dimensions.width30, vertical: Dimensions.height15),
            hintText: "",
            suffixIcon: Material(
              elevation: Dimensions.height10/2,
              borderRadius: BorderRadius.circular(Dimensions.radius30),
              child: const Icon(
                Icons.key,
                color: AppColors.black,
              ),
            ),
            border: InputBorder.none,
          ),
        ),

      ),
    ),
          ),
         SizedBox(
            height: Dimensions.height20,
          ),

          Center(
            child: 
                 Button(
                  on_pressed: () async{
                    LoadingUtils.showLoader();
                    var key=await FirebaseFirestore.instance.collection('bookings').get();
                    final allData=key.docs.map((docs) =>docs.data()).toList();
                    bool accepted=false;
                    for(var data in allData){
                      print(Ikey.text+' -------------- '+data['rideKey']+'----------------'+data['ambulanceStatus']);
                      if(data['rideKey']==Ikey.text && data['ambulanceStatus']=='assigned'){
                        FirebaseFirestore.instance.collection('bookings').doc(data['userId']).update({
                          'emtId':SPController().getUserId()
                        });
                        accepted=true;
                        LoadingUtils.hideLoader();
                        
                        controller.onAmbulanceBooked(true,data['userId']);
                        
                      }
                    }
                    if(accepted==false){
                      LoadingUtils.hideLoader();
                      snackbar('Enter valid key or patient is not assigned yet.');
                    }
                    

                    
                  },
                  text: 'Enter',
                  radius: Dimensions.radius20 * 2,
                  width: Dimensions.width40 * 6,
                  height: Dimensions.height40*1.5,
                  color: Color(0xFF589D4C),
                )
              
          ),
        ],
      ),
    );
  }
}
