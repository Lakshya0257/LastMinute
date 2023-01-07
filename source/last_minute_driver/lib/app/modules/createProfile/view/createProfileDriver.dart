// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/app/modules/homePage/view/homePageDriver.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../../../widgets/button.dart';
import '../../../../widgets/drop_down.dart';
import '../../../../widgets/text_field.dart';
import '../controller/createProfileDriverController.dart';

class CreateProfileDriver extends GetView<CreateProfileDriverController> {
  static const route = '/createprofile-driver';
  static launch() => Get.toNamed(route);
  const CreateProfileDriver({super.key});

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
                      text: 'Create Profile',
                      size: Dimensions.font26 * 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                    SizedBox(
                      height: Dimensions.height30,
                    ),
                    Text_Field(
                        radius: Dimensions.radius20,
                        text_field_width: double.maxFinite,
                        text_field_height: Dimensions.height20 * 3,
                        text_field: TextField(
                          controller: controller.name,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.person,
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
                        text_field_height: Dimensions.height20 * 3,
                        text_field: Center(
                          child: TextField(
                            controller: controller.mobileNumber,
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.phone,
                                color: AppColors.pink,
                              ),
                              hintText: 'Mobile No.',
                            ),
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
                                  Icons.location_city,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropDown(
                          width: Dimensions.width40 * 4.5,
                          height: Dimensions.height20 * 3,
                          name: 'Gender',
                          value: controller.value,
                          items: controller.dropDownList.map((String items) {
                            return DropdownMenuItem(
                              alignment: Alignment.center,
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (newValue) {
                            controller.onChangedList(newValue.toString());
                          },
                        ),
                        Text_Field(
                            radius: Dimensions.radius20,
                            text_field_width: Dimensions.width40 * 4.5,
                            text_field_height: Dimensions.height20 * 3,
                            text_field: TextField(
                              controller: controller.bloodGroup,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                prefixIcon: Icon(
                                  Icons.bloodtype,
                                  color: AppColors.pink,
                                ),
                                hintText: 'Blood Group',
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    Text_Field(
                        radius: Dimensions.radius20,
                        text_field_width: double.maxFinite,
                        text_field_height: Dimensions.height20 * 3,
                        text_field: TextField(
                          controller: controller.drivingLicence,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.car_rental,
                              color: AppColors.pink,
                            ),
                            hintText: 'Driving Licence',
                          ),
                        )),
                    SizedBox(
                      height: Dimensions.height40 * 5,
                    ),
                    Button(
                      width: double.maxFinite,
                      height: Dimensions.height40 * 1.5,
                      radius: Dimensions.radius20 * 2,
                      on_pressed: () {
                        controller.onCreateProfile();
                        
                      },
                      text: 'CONTINUE',
                      color: AppColors.pink,
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
