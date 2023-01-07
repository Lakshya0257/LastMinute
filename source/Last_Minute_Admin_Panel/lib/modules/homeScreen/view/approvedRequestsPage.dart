// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../data/model/driverStaffStaticModel.dart';
import '../../../utils/colors.dart';
import '../../../utils/dimensions.dart';
import '../../../widgets/big_text.dart';

class ApprovedRequestsPage extends StatelessWidget {
  ApprovedRequestsPage({super.key});

  final staticData = DriverStaffStaticModel.getStaticData();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: GridView.builder(
            itemCount: staticData.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: MediaQuery.of(context).size.width /
                  (MediaQuery.of(context).size.height / 1.8),
            ),
            itemBuilder: ((context, index) => SizedBox(
                  width: Dimensions.width40 * 9,
                  height: Dimensions.height40 * 9,
                  child: Card(
                    margin: EdgeInsets.symmetric(
                        horizontal: Dimensions.width40,
                        vertical: Dimensions.height10),
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20)),
                    elevation: 6,
                    color: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.all(Dimensions.height20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                  text: 'Time of Ambulance',
                                  color: AppColors.pink,
                                ),
                                SizedBox(
                                  width: Dimensions.width50 * 2,
                                ),
                                Container(
                                  height: Dimensions.height40,
                                  width: Dimensions.width40 * 3.5,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 2, color: AppColors.grey),
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(Dimensions.radius20),
                                      ),
                                      color: AppColors.white),
                                  child: Center(
                                    child: BigText(
                                      text: staticData[index].timeOfArrival,
                                      size: Dimensions.font15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                  text: 'Ambulance Driver',
                                  size: Dimensions.font15,
                                  color: AppColors.pink,
                                ),
                                SizedBox(
                                  width: Dimensions.width40 * 3.5,
                                ),
                                BigText(
                                  text: staticData[index].driverName,
                                  fontWeight: FontWeight.w500,
                                  size: Dimensions.font10 * 1.6,
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.phone,
                                  color: const Color(0xFFBF0000),
                                  size: Dimensions.iconSize10 * 2,
                                ),
                                SizedBox(
                                  width: Dimensions.width30,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height10,
                            ),
                            Align(
                                alignment: Alignment.centerLeft,
                                child: BigText(
                                  text: 'XY 23 BP 1111',
                                  fontWeight: FontWeight.w400,
                                  size: Dimensions.font15,
                                )),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(
                                  text: 'Nurse',
                                  size: Dimensions.font15,
                                  color: AppColors.pink,
                                ),
                                SizedBox(
                                  width: Dimensions.width40 * 5.6,
                                ),
                                BigText(
                                  text: staticData[index].staffName,
                                  fontWeight: FontWeight.w500,
                                  size: Dimensions.font10 * 1.6,
                                ),
                                const Spacer(),
                                Icon(
                                  Icons.phone,
                                  color: const Color(0xFFBF0000),
                                  size: Dimensions.iconSize10 * 2,
                                ),
                                SizedBox(
                                  width: Dimensions.width30,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: Dimensions.height20,
                            ),
                          ]),
                    ),
                  ),
                ))));
  }
}
