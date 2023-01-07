// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/app/modules/homePage/controller/homePageStaffController.dart';
import 'package:last_minute_driver/app/modules/medicalReport/view/medicalReport.dart';
import 'package:last_minute_driver/widgets/button.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../controller/patientStaffController.dart';

class PatientDetailsStaff extends StatelessWidget {
  PatientDetailsStaffController controller = Get.find();
  HomepageStaffController homepageStaffController = Get.find();
  ScrollController scrollController;
  PatientDetailsStaff({super.key, required this.scrollController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Dimensions.width15, Dimensions.height10,
          Dimensions.width15, Dimensions.height30),
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
                controller: scrollController,
                child: SizedBox(
                  child: StreamBuilder(
                      stream: FirebaseFirestore.instance
                          .collection('bookings')
                          .doc(homepageStaffController.patientId)
                          .snapshots(),
                      builder: (context, snapshot) {
                        DocumentSnapshot<Map<String, dynamic>>?
                            patientDocument;
                        DocumentSnapshot<Map<String, dynamic>>? patient;

                        if (snapshot.hasData) {
                          var dataa = snapshot.data!;

                          if (dataa['userId'] ==
                                  homepageStaffController.patientId &&
                              dataa['ambulanceStatus'] == 'assigned') {
                            patientDocument = dataa;

                            
                            if (homepageStaffController.document != null) {
                               homepageStaffController.onGetPatientLocation(patientDocument['location']['lat'], patientDocument['location']['lng'], patientDocument['ambulanceLocation']['lat'], patientDocument['ambulanceLocation']['lng'], patientDocument['ambulanceLocation']['time']);
                              patient=(homepageStaffController.document!);
                            }
                          }

                          if(patientDocument==null){
                            // homepageStaffController.key.clear();
                            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                              homepageStaffController.document=null;
                              homepageStaffController.onAmbulanceBooked(false, '');
                            
                            });

                           // homepageStaffController.onGetPatientLocation(patientDocument['location']['lat'], patientDocument['location']['lng'], patientDocument['ambulanceLocation']['lat'], patientDocument['ambulanceLocation']['lng'], patientDocument['ambulanceLocation']['time']);

                          }
                        }

                        return patient==null
                            ? const Text('Loading')
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: Dimensions.width20 * 4,
                                    height: Dimensions.height10 / 5,
                                    decoration: BoxDecoration(
                                        color: AppColors.lightGrey,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                  ),
                                  
                                  SizedBox(
                                    height: Dimensions.height15,
                                  ),
                                  BigText(
                                    text: 'Patient Details',
                                    size: Dimensions.font20 * 1.3,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: Dimensions.height20 * 1.5,
                                  ),
                                  Button(
                        on_pressed: () {},
                        text: 'Estimated Arrival: ${patientDocument!['ambulanceLocation']['time']}',
                        color: AppColors.black,
                        textColor: AppColors.white,
                        width: Dimensions.width40 * 6,
                        height: Dimensions.height40 * 1.1,
                        textSize: Dimensions.font20 * 0.8,
                      ),
                      SizedBox(
                                    height: Dimensions.height20 * 1.5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: 'Name  ',
                                        size: Dimensions.font15 * 1.2,
                                      ),
                                      BigText(
                                        text: patient['name'],
                                        size: Dimensions.font15 * 1.2,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.height15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: 'Phone number  ',
                                        size: Dimensions.font15 * 1.2,
                                      ),
                                      BigText(
                                        text: patient['phone']
                                            .toString(),
                                        size: Dimensions.font15 * 1.2,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Dimensions.height15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      BigText(
                                        text: 'User Id  ',
                                        size: Dimensions.font15 * 1.2,
                                      ),
                                      BigText(
                                        text: patient['user Id'],
                                        size: Dimensions.font15 * 1.2,
                                      )
                                    ],
                                  ),
                                  const Divider(
                                    thickness: 1,
                                    color: AppColors.lightGrey,
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Center(
                                            child: BigText(
                                              text: 'Nearest Hospital',
                                              fontWeight: FontWeight.w500,
                                              size: Dimensions.font26 * 0.8,
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.width10,
                                                    top: Dimensions.height10 /
                                                        2),
                                                child: CircleAvatar(
                                                  radius: Dimensions.radius20,
                                                  backgroundImage:
                                                      const NetworkImage(
                                                          'https://i.pinimg.com/originals/90/07/f5/9007f5b83b93ebda87bab0764735a1d5.png'),
                                                ),
                                              ),
                                              SizedBox(
                                                width: Dimensions.width10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  BigText(
                                                    text: '---',
                                                    size: Dimensions.font20,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.width10,
                                                    top:
                                                        Dimensions.height10 / 2,
                                                    bottom:
                                                        Dimensions.height10 /
                                                            1.5),
                                                child: CircleAvatar(
                                                  radius: Dimensions.radius20,
                                                  backgroundColor: Colors.green,
                                                  child: Icon(
                                                    Icons.call_outlined,
                                                    color: Colors.white,
                                                    size: Dimensions.iconSize24,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: Dimensions.width10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  BigText(
                                                    text: 'Call Emergency Team',
                                                    size: Dimensions.font20,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10 / 2,
                                          ),
                                          Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: Dimensions.width10,
                                                    top:
                                                        Dimensions.height10 / 2,
                                                    bottom:
                                                        Dimensions.height10 /
                                                            1.5),
                                                child: CircleAvatar(
                                                  radius: Dimensions.radius20,
                                                  backgroundColor: Colors.green,
                                                  child: Icon(
                                                    Icons.mic,
                                                    color: Colors.white,
                                                    size: Dimensions.iconSize24,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: Dimensions.width10,
                                              ),
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  BigText(
                                                    text:
                                                        'Send Updates Via Voice Note',
                                                    size: Dimensions.font20,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              );
                      }),
                )),
          ),
          Button(
            on_pressed: () {
              MedicalReport.launch();
            },
            text: 'Create Medical Report',
            //width: Dimensions.width40 * 6.5,
            height: Dimensions.height40 * 1.3,
            color: AppColors.pink,
            textColor: Colors.white,
            //boxBorder: Border.all(width: 2, color: AppColors.pink),
          )

          // GetBuilder<PatientDetailsController>(

          //   builder: (_) {
          //     return controller.informationUpdated? Button(
          //       width: double.maxFinite,
          //       height: Dimensions.height40 * 1.5,
          //       radius: Dimensions.radius20 * 2,
          //       on_pressed: () {

          //       },
          //       text: 'FIRST AID',
          //       color: AppColors.pink,
          //     ):
          //     Button(
          //       width: double.maxFinite,
          //       height: Dimensions.height40 * 1.5,
          //       radius: Dimensions.radius20 * 2,
          //       on_pressed: () {
          //         controller.onPageChanged(true);
          //       },
          //       text: 'ADD ADDITIONAL DATA',
          //       color: AppColors.pink,
          //     );
          //   },
          // ),
        ],
      ),
    );
  }
}
