// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/widgets/button.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../homePage/controller/homePageDriverController.dart';
import '../controller/patientDriverController.dart';

class PatientDetailsDriver extends GetView<PatientDetailsDriverController> {
  HomepageDriverController homepageController = Get.find();
  ScrollController scrollController;
  String? patientId;
  PatientDetailsDriver(
      {super.key, required this.scrollController, this.patientId = ''});

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
                  StreamBuilder(
                      stream:
                          FirebaseFirestore.instance.collection('bookings').snapshots(),
                      builder: (context, snapshot) {
                        
                        DocumentSnapshot<Map<String, dynamic>>? patient;
                        if(snapshot.hasData){
                          final List<DocumentSnapshot> users =
                            snapshot.data!.docs;
                        for (var user in users) {
                          if (user['userId'] == patientId && user['ambulanceStatus']=='assigned') {
                            homepageController.onGetPatientLocation(user['location']['lat'],user['location']['lng']);
                            if(homepageController.document!=null)patient=(homepageController.document!);
                          }
                        }
                        

                        }
                        return patient==null? const Text('Loading'): Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                BigText(
                                  text: 'Phone number  ',
                                  size: Dimensions.font15 * 1.2,
                                ),
                                BigText(
                                  text: patient['phone'].toString(),
                                  size: Dimensions.font15 * 1.2,
                                )
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height15,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          ],
                        );
                      }),
                      SizedBox(height: Dimensions.height15,),
                  Button(
                    on_pressed: () {},
                    height: Dimensions.height40 * 1.4,
                    width: Dimensions.width40 * 5,
                    text: "Patient Picked",
                    textColor: AppColors.pink,
                    boxBorder: Border.all(width: 2, color: AppColors.pink),
                    color: Colors.transparent,
                    radius: Dimensions.radius30,
                  ),
                  const Divider(
                    thickness: 1,
                    color: AppColors.lightGrey,
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                                    top: Dimensions.height10 / 2),
                                child: CircleAvatar(
                                  radius: Dimensions.radius20,
                                  backgroundImage: const NetworkImage(
                                      'https://i.pinimg.com/originals/90/07/f5/9007f5b83b93ebda87bab0764735a1d5.png'),
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.width10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  BigText(
                                    text: 'abcd',
                                    size: Dimensions.font20,
                                  ),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: Dimensions.height10,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Button(
                    on_pressed: () {
                      FirebaseFirestore.instance.collection('bookings').doc(patientId).update({
                        'ambulanceStatus': 'completed'
                      });
                      homepageController.onAmbulanceBooked(false, '');
                    },
                    height: Dimensions.height40 * 1.3,
                    width: Dimensions.width40 * 6,
                    text: "Ride Completed",
                    textColor: AppColors.white,
                    color: AppColors.pink,
                    radius: Dimensions.radius30,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
