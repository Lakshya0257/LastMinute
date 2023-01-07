// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_admin_panel/modules/homeScreen/view/homePage.dart';

import 'package:last_minute_admin_panel/widgets/big_text.dart';

import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../controller/loginController.dart';

class LoginPage extends GetView<LoginController> {
  static const route = '/login';
  static launch() => Get.toNamed(route);
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 8,
                              child: Row(
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigText(
                                    text: 'HOSPITAL ',
                                    color: AppColors.black,
                                    fontWeight: FontWeight.bold,
                                    size: Dimensions.font26*1.4,
                                  ),
                                  BigText(
                                    text: ' LOGIN ',
                                    color: Color(0xFFFF3D62),
                                    fontWeight: FontWeight.bold,
                                    size: Dimensions.font26*1.4,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                //margin: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    border: Border.all(
                                        width: 2, color: AppColors.pink),
                                    color: AppColors.white),
                                child: Padding(
                                  padding:  EdgeInsets.only(left: Dimensions.width30),
                                  child: TextField(
                                    controller: controller.email,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'email'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                //margin: EdgeInsets.symmetric(horizontal: Dimensions.width20, vertical: Dimensions.height20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    border: Border.all(
                                        width: 2, color: AppColors.pink),
                                    color: AppColors.white),
                                child: Padding(
                                  padding:  EdgeInsets.only(left: Dimensions.width30),
                                  child: TextField(
                                    controller: controller.password,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                        hintText: 'password'),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: SizedBox(),
                      ),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(),
                            ),
                            Expanded(
                              flex: 8,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius20),
                                    color: AppColors.pink),
                                child: InkWell(
                                  onTap: (){
                                    HomePage.launch();
                                  },
                                  child: Center(
                                      child: BigText(
                                    text: 'LOGIN',
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    size: Dimensions.font26,
                                  )),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: SizedBox(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(width: 5, color: Colors.white),
                          color: Colors.white,
                          image: const DecorationImage(
                              image: AssetImage(
                                  'assets/images/panelLoginImage.png'),
                              fit: BoxFit.fill))),
                ),
              ]),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
