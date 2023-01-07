import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_driver/app/modules/login/view/login.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../../../widgets/button.dart';
import '../../createProfile/view/createProfileStaff.dart';

class LoginAsPage extends StatelessWidget {
  static const route='/loginAs-page';
  static launch()=>Get.toNamed(route);
  const LoginAsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
         padding: EdgeInsets.fromLTRB(Dimensions.width15, Dimensions.height10,
              Dimensions.width15, Dimensions.height30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network('https://www.pngkit.com/png/detail/251-2511622_ambulance-drawing-side-view-ambulance-cartoon.png'),
            SizedBox(
                        height: Dimensions.height20,
                      ),
                      Row(
                        children: [
                          const Expanded(child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(thickness: 2,color: AppColors.black,),
                          )),
                          BigText(text: 'Last Minute',size: Dimensions.font20*1.8,),
                          const Expanded(child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Divider(thickness: 2,color: AppColors.black,),
                          )),
                        ],
                      ),
                      SizedBox(height: Dimensions.height40*7.5,),
                      SizedBox(
                            height: Dimensions.height20,
                          ),
                      
                          Button(
                            boxBorder: Border.all(color: AppColors.pink,width: 2),
                            width: double.maxFinite,
                            height: Dimensions.height40 * 1.5,
                            radius: Dimensions.radius20 * 2,
                            on_pressed: () {
                              LogIn.launch();
                            },
                            text: 'Driver',
                            color: AppColors.white,
                            textColor: AppColors.pink,
                            
                          ),
                          SizedBox(
                            height: Dimensions.height15,
                          ),
                          Button(
                            width: double.maxFinite,
                            height: Dimensions.height40 * 1.5,
                            radius: Dimensions.radius20 * 2,
                            on_pressed: () {
                              Get.to(()=>LogIn(driverLogin: false,));
                            },
                            text: 'Medical Staff',
                            color: AppColors.pink,
                          ),
                          SizedBox(
                            height: Dimensions.height20,
                          ),
          ],
        ),
      )),
    );
  
  }
}