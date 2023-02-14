// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute/app/modules/ambulance_details/controller/ambulance_controller.dart';
import 'package:last_minute/app/modules/homepage/controller/homepage_controller.dart';
import 'package:last_minute/helper/shimmer.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/big_text.dart';
import '../../../../widgets/button.dart';

class PanelWidget extends GetView<HomepageController> {
  AmbulanceDetailsController ambulanceController=Get.find();
   PanelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(Dimensions.width15, Dimensions.height10,
          Dimensions.width15, Dimensions.height30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: Dimensions.height18,
            ),
            Obx(
              () => controller.selectedAddress?.value == 'Loading'
                  ? Column(
                      children: const [
                        CustomShimmer.rectangular(height: 22),
                        SizedBox(
                          height: 8,
                        ),
                        CustomShimmer.rectangular(height: 22)
                      ],
                    )
                  : BigText(
                      text: controller.selectedAddress!.value,
                      maxLines: 3,
                    ),
            ),
            SizedBox(
              height: Dimensions.height30,
            ),
            Button(
              on_pressed: () {
                controller.onAmbulanceBooked(true);
                //ambulanceController.onInformationUpdated(false);
                
              },
              text: 'BOOK AMBULANCE',
              radius: Dimensions.radius20 * 2,
              width: double.maxFinite,
              color: AppColors.pink,
            ),
          ],
        ),
      ),
    );
  }
}
