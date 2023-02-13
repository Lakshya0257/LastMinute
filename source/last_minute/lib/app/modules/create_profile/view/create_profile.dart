import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute/app/modules/create_profile/controller/create_profile_controller.dart';
import 'package:last_minute/helper/snackbar.dart';
import 'package:last_minute/utils/colors.dart';
import 'package:last_minute/widgets/big_text.dart';

import '../../../../utils/dimensions.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/text_field.dart';

class CreateProfile extends GetView<CreateProfileController> {
  static const route = '/createprofile';
  static launch() => Get.toNamed(route);
  const CreateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Dimensions.screenWidth,
        height: Dimensions.screenHeight,
        child: SafeArea(
          child: Padding(
              padding: EdgeInsets.fromLTRB(
                  Dimensions.width15,
                  Dimensions.height40 * 2,
                  Dimensions.width15,
                  Dimensions.height30),
              child: SingleChildScrollView(
                child: Column(

                  children: [

                    BigText(
                      text: 'We are on the Way to save lives',
                      maxLines: null,
                      size: Dimensions.font20 * 2,
                      color: AppColors.grey,
                    ),
                    SizedBox(height: Dimensions.height40*5,),
                    Column(
                      children: [
                        Text_Field(
                            radius: Dimensions.radius20,
                            text_field_width: double.maxFinite,
                            text_field_height: Dimensions.height20 * 3,
                            text_field: TextField(
                              controller: controller.name,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: AppColors.pink,
                                ),
                                hintText: 'Name',
                              ),
                            )),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Text_Field(
                            radius: Dimensions.radius20,
                            text_field_width: double.maxFinite,
                            text_field_height: Dimensions.height20 * 6,
                            text_field: Center(
                              child: SingleChildScrollView(
                                child: TextField(
                                  controller: controller.address,
                                  maxLines: null,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: AppColors.pink,
                                    ),
                                    hintText: 'Address',
                                  ),
                                ),
                              ),
                            )),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Text_Field(
                            radius: Dimensions.radius20,
                            text_field_width: double.maxFinite,
                            text_field_height: Dimensions.height20 * 3,
                            text_field: TextField(
                              controller: controller.state,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: AppColors.pink,
                                ),
                                hintText: 'State',
                              ),
                            )),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Text_Field(
                            radius: Dimensions.radius20,
                            text_field_width: double.maxFinite,
                            text_field_height: Dimensions.height20 * 3,
                            text_field: TextField(
                              controller: controller.city,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: AppColors.pink,
                                ),
                                hintText: 'City',
                              ),
                            )),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Text_Field(
                            radius: Dimensions.radius20,
                            text_field_width: double.maxFinite,
                            text_field_height: Dimensions.height20 * 3,
                            text_field: TextField(
                              controller: controller.phoneNumber,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: AppColors.pink,
                                ),
                                hintText: 'Phone Number',
                              ),
                            )),
                        SizedBox(
                          height: Dimensions.height20,
                        ),
                        Button(
                          width: double.maxFinite,
                          height: Dimensions.height40 * 1.5,
                          radius: Dimensions.radius20 * 2,
                          on_pressed: () {
                            if(controller.name.text.isEmpty){
                              snackbar('Kindly Enter your name');
                            }
                            else if(controller.address.text.isEmpty){
                              snackbar('Kindly enter your address');
                            }
                            else if(controller.state.text.isEmpty){
                              snackbar('Kindly enter your state');
                            }
                            else if(controller.city.text.isEmpty){
                              snackbar('Kindly enter your city');
                            }
                            else if(controller.phoneNumber.text.isEmpty){
                              snackbar('Kindly enter your phone number');
                            }
                            else{
                              controller.onCreateProfile();
                            }

                          },
                          text: 'Create Profile',
                          color: AppColors.pink,
                        ),
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
