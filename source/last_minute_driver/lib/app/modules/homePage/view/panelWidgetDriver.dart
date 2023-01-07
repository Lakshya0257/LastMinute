// ignore_for_file: must_be_immutable, file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/app/data/model/distance.dart';
import 'package:last_minute_driver/app/data/model/repo_response.dart';
import 'package:last_minute_driver/app/data/repo/distance_repo.dart';
import 'package:last_minute_driver/helper/loading.dart';
import 'package:last_minute_driver/helper/snackbar.dart';
import 'package:last_minute_driver/utils/colors.dart';
import '../../../../helper/shared_preference.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../../../widgets/button.dart';
import '../controller/homePageDriverController.dart';
import 'dart:math';



class PanelWidgetDriver extends GetView<HomepageDriverController> {
  DistanceRepository repo=DistanceRepository();
  static const route='/panelWidget';
  List<double> distance=[];
  var data = [];
  PanelWidgetDriver({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Dimensions.width15, Dimensions.height10,
          Dimensions.width15, Dimensions.height30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         
          SizedBox(
            height: Dimensions.height30,
          ),
          Align(
              alignment: Alignment.center,
              child: BigText(
                text: 'Emergency',
                color: const Color(0xFFFF0000),
                size: Dimensions.font26 * 1.4,
              )),
          SizedBox(
            height: Dimensions.height30,
          ),
          Center(child: BigText(text: 'Patient Located')),

          SizedBox(
            height: Dimensions.height20,
          ),
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('bookings').snapshots(),
            builder: ((context, snapshot) {
              // locations.clear();
              data.clear();
              if (snapshot.hasData) {
                final bookings = snapshot.data!.docs;
                for (var booking in bookings) {
                  if (booking['ambulanceStatus'] == 'not assigned') {
                    data.add(booking);
                    
                  }
                }
              }
              
              
              return SizedBox(
                height: Dimensions.height40 * 3,
                child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Row(
                            children: [
                              BigText(
                                text: 'Id of Patient: ',
                                color: const Color(0xFFFF0000),
                                size: Dimensions.font15,
                              ),
                              SizedBox(
                                width: Dimensions.width15,
                              ),
                              Expanded(
                                child: BigText(
                                  maxLines: null,
                                  text: data[index]['userId'],
                                  size: Dimensions.font15,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height30,
                          ),
                        ],
                      );
                    }),
              );
            }),
          ),
          SizedBox(
            height: Dimensions.height20,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Button(
               on_pressed: ()async {
                
                distance.clear();
                 if(data.isNotEmpty){
                  LoadingUtils.showLoader();
                  for(int i=0;i<data.length;i++){
                    double lat=data[i]['location']['lat'];
                    double lng=data[i]['location']['lng'];
                    RepoResponse<DistanceMatrix> response= await repo.getDistance(controller.currentLocation!.latitude!,controller.currentLocation!.longitude!,lat, lng);
                    String dist=response.data!.rows![0].elements![0].distance!.text!.substring(0,response.data!.rows![0].elements![0].distance!.text!.indexOf(' '));
                    double distances=double.parse(dist);
                    distance.add(distances);
                  }
                  int smallestIndex=distance.indexOf(distance.reduce(min));
                  String bookedPatient=data[smallestIndex]['userId'];
                  FirebaseFirestore.instance.collection('bookings').doc(bookedPatient).update({
                     'ambulanceDetails':{
                       'driverId':SPController().getUserId(),
                     },
                     'ambulanceStatus':'assigned',
                     'rideKey':SPController().getUserId().toString().substring(0,6)
                   });
                  LoadingUtils.hideLoader();
                  controller.onAmbulanceBooked(true,bookedPatient);

                   
                 }
                 else{
                  LoadingUtils.hideLoader();
                  snackbar('Nothing to accept!');
                 }
                 
                 
               },
               text: 'Accept',
               
               textColor: AppColors.white,
               radius: Dimensions.radius20 * 2,
               width: Dimensions.width40 * 4,
               height: Dimensions.height40*1.2,
               color: AppColors.pink,
                    ),
                Button(
               on_pressed: () {
                //  if(data.isNotEmpty){
                //    FirebaseFirestore.instance.collection('bookings').doc(data[0]['userId']).update({
                //      'ambulanceDetails':{
                //        'driverId':SPController().getUserId(),
                       
                //      },
                //      'ambulanceStatus':'assigned'
                //    });
                //  }
                //  controller.onAmbulanceBooked(true);
               },
               text: 'Decline',
               textColor: AppColors.pink,
               radius: Dimensions.radius20 * 2,
               width: Dimensions.width40 * 4,
               height: Dimensions.height40*1.2,
               color: AppColors.white,
               boxBorder: Border.all(width: 2, color: AppColors.pink),
                    ),
         
            ],
          ),
        ],
      ),
    );
  }
}
