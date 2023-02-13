import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute/app/modules/login/controller/login_controller.dart';
import 'package:last_minute/utils/colors.dart';
import 'package:last_minute/utils/dimensions.dart';
import 'package:last_minute/widgets/big_text.dart';
import 'package:last_minute/widgets/button.dart';
import 'package:last_minute/widgets/text_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


class LogIn extends GetView<LogInController> {
  static const route = '/login';
  static launch() => Get.toNamed(route);
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(Dimensions.width15, Dimensions.height10,
              Dimensions.width15, Dimensions.height30),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Image.network(
                            'https://www.pngkit.com/png/detail/251-2511622_ambulance-drawing-side-view-ambulance-cartoon.png')),
                    SizedBox(
                      height: Dimensions.height15,
                    ),

                    Row(
                      children: [
                        const Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 2,
                            color: AppColors.black,
                          ),
                        )),
                        BigText(
                          text: 'Last Minute',
                          size: Dimensions.font20 * 1.8,
                        ),
                        const Expanded(
                            child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 2,
                            color: AppColors.black,
                          ),
                        )),
                      ],
                    )
                    // Button(
                    //   on_pressed: () {},
                    //   text: 'EMERGENCY',
                    //   radius: Dimensions.radius20 * 2,
                    //   width: double.maxFinite,

                    //   color: AppColors.deepRed,
                    // ),
                  ],
                ),
              ),
              Obx(() => controller.sendOtp
                  ? Expanded(
                      child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Center(
                              child: GestureDetector(
                                onTap: () {
                                  controller.onSendOtp();
                                },
                                child: Container(
                                  width: Dimensions.width40 * 8,
                                  height: Dimensions.height20 * 2.5,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      border: Border.all(
                                          color: AppColors.pink, width: 2)),
                                  child: Center(
                                    child: Text(
                                        controller.mobileNumberController.text),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            BigText(
                              text: 'Enter Otp',
                              fontWeight: FontWeight.bold,
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            SizedBox(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: Dimensions.width40),
                                child: PinCodeTextField(
                                    pinTheme: PinTheme(
                                      shape: PinCodeFieldShape.box,
                                      borderRadius: BorderRadius.circular(15),
                                      activeColor: AppColors.pink,
                                      inactiveColor: AppColors.pink,
                                      selectedColor: AppColors.pink,
                                    ),
                                    appContext: context,
                                    length: 6,
                                    onChanged: (value) {
                                      controller.onChangedOtp(value);
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            BigText(text: 'By clicking Login, you accept our'),
                            BigText(
                              text: 'Terms and Conditions',
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Button(
                              width: double.maxFinite,
                              height: Dimensions.height40 * 1.5,
                              radius: Dimensions.radius20 * 2,
                              on_pressed: () {
                                controller.onLogin();
                              },
                              text: 'LogIn',
                              color: AppColors.pink,
                            ),
                          ],
                        ),
                      ),
                    ))
                  : Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Center(
                            child: Text_Field(
                                radius: Dimensions.radius20,
                                text_field_width: double.maxFinite,
                                text_field_height: Dimensions.height20 * 3,
                                text_field: TextField(
                                  controller: controller.mobileNumberController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: AppColors.pink,
                                    ),
                                    hintText: 'Mobile Number',
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
                          Button(
                            width: double.maxFinite,
                            height: Dimensions.height40 * 1.5,
                            radius: Dimensions.radius20 * 2,
                            on_pressed: () {
                              controller.onSendOtp();
                            },
                            text: 'Send Otp',
                            color: AppColors.pink,
                          ),
                        ],
                      ),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
