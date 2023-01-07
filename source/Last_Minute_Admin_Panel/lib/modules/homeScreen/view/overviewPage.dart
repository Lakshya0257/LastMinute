

import 'package:flutter/material.dart';
import 'package:last_minute_admin_panel/utils/colors.dart';
import 'package:last_minute_admin_panel/widgets/big_text.dart';

import '../../../utils/dimensions.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Row(
        children: [
          Expanded(
            flex: 4,
            child: Column(
              children: [
                SizedBox(
                  height: Dimensions.height40,
                ),
                Container(
                  height: Dimensions.heigth50 * 4.5,
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width40),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF4F6),
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(
                      child: BigText(
                    text: 'Welcome to AIIMS, Delhi',
                    size: Dimensions.font26,
                  )),
            
                  // color: Colors.blueAccent,
                ),
                SizedBox(
                  height: Dimensions.height40,
                ),
                Container(
                  height: Dimensions.heigth50 * 3,
                  width: double.maxFinite,
                  margin: EdgeInsets.symmetric(horizontal: Dimensions.width40),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF4F6),
                    borderRadius: BorderRadius.circular(Dimensions.radius15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: Dimensions.width30,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Icon(
                              Icons.calendar_month_rounded,
                              color: Color(0xFFFF3D62),
                              size: Dimensions.iconSize24 * 1.5,
                            )),
                            SizedBox(
                              width: Dimensions.width30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: '08'),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigText(
                                  text: 'Bookings',
                                  size: Dimensions.font10 * 1.4,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigText(
                                  text: 'Today',
                                  size: Dimensions.font10 * 1.3,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: Dimensions.width50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: Dimensions.height20),
                              child: SizedBox(
                                height: Dimensions.heigth50 * 2.2,
                                child: VerticalDivider(
                                  color: AppColors.black,
                                  thickness: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Dimensions.width50,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Icon(
                              Icons.calendar_month_rounded,
                              color: Color(0xFFFF3D62),
                              size: Dimensions.iconSize24 * 1.5,
                            )),
                            SizedBox(
                              width: Dimensions.width30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: '03'),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigText(
                                  text: 'Urgent Cases',
                                  size: Dimensions.font10 * 1.4,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigText(
                                  text: 'Today',
                                  size: Dimensions.font10 * 1.3,
                                )
                              ],
                            ),
                            SizedBox(
                              width: Dimensions.width50,
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: Dimensions.height20),
                              child: SizedBox(
                                height: Dimensions.heigth50 * 2.2,
                                child: VerticalDivider(
                                  color: AppColors.black,
                                  thickness: 1,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Dimensions.width50,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Icon(
                              Icons.calendar_month_rounded,
                              color: Color(0xFFFF3D62),
                              size: Dimensions.iconSize24 * 1.5,
                            )),
                            SizedBox(
                              width: Dimensions.width30,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigText(text: '11'),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigText(
                                  text: 'Doctors Available',
                                  size: Dimensions.font10 * 1.4,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigText(
                                  text: 'Today',
                                  size: Dimensions.font10 * 1.3,
                                )
                              ],
                            ),
                            SizedBox(
                              width: Dimensions.width50,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: Dimensions.width30,
                        ),
                      ]),
            
                  // color: Colors.blueAccent,
                ),
                SizedBox(
                  height: Dimensions.height40,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: Dimensions.width50),
                  child: SizedBox(
                    height: Dimensions.heigth50 * 5,
                    //color: Colors.yellow,
                    child: Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                      return Padding(padding: EdgeInsets.all(Dimensions.height15),
                      child: SizedBox(
                        height: Dimensions.heigth50*2.5,
                        width: Dimensions.heigth50*5,
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(Dimensions.radius20),
                          
                          ),
                          elevation: 5,
                          color: Color(0xFFFFE0E0),
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: BigText(text: 'Dr. Sachin')),
                          ),
                        ),
                      ),);
                    }),
                  ),
                  ),
                ),
                
            
              ],
            ),
          ),
          SizedBox(
            width: Dimensions.width30,
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    width: double.maxFinite,
                    height: Dimensions.height40*6,
                    decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFFFE0E0)
                    ),
                    child: Center(child: BigText(text: 'Graph'),)),
                    SizedBox(height: Dimensions.height20,),
                  Container(width: double.maxFinite,
                  height: Dimensions.height40*4
                  ,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFFFFE0E0),)
                  ,
                  
                  child: Center(child: BigText(text: 'Ambulance Records')),
                  ),SizedBox(height: Dimensions.height20,),
                  Container(width: double.maxFinite,
                  height: Dimensions.height40*4
                  ,
                  
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFFFFE0E0),)
                  ,
                  child: Center(child: BigText(text: 'Patient Records')),
                  ),SizedBox(height: Dimensions.height20,),
                  Container(width: double.maxFinite,
                  height: Dimensions.height40*4
                  ,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Color(0xFFFFE0E0),)
                  ,
                  child: Center(child: BigText(text: 'Emergency Department Records')),
                  ),
              
                ]),
              ),
            ),
          )
        ],
      ),
    );
    // Column(
    //   children: [

    //     const Spacer(),
    //     Expanded(
    //         child: ListView.builder(
    //             scrollDirection: Axis.horizontal,
    //             itemCount: 4,
    //             itemBuilder: (context, index) {
    //               return Padding(
    //                 padding: EdgeInsets.all(Dimensions.height15),
    //                 child: SizedBox(
    //                   height: Dimensions.heigth50 * 2.5,
    //                   width: Dimensions.width50 * 6,
    //                   child: Card(
    //                     shape: RoundedRectangleBorder(
    //                         borderRadius:
    //                             BorderRadius.circular(Dimensions.radius20)),
    //                     color: const Color(0xFFFFE0E0),
    //                     elevation: 5,
    //                   ),
    //                 ),
    //               );
    //             })),
    //             SizedBox(height: Dimensions.height15,)
    //   ],
    // );
  }
}
