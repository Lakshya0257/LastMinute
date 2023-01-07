// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:last_minute_admin_panel/modules/homeScreen/view/approvedRequestsPage.dart';
import 'package:last_minute_admin_panel/modules/homeScreen/view/bookingRequestsPage.dart';
import 'package:last_minute_admin_panel/modules/homeScreen/view/overviewPage.dart';
import 'package:last_minute_admin_panel/utils/colors.dart';
import 'package:last_minute_admin_panel/widgets/big_text.dart';

import '../../../utils/dimensions.dart';
import '../controller/homePageController.dart';

class HomePage extends GetView<HomePageController> {
   static const route = '/homepage';
  static launch() => Get.toNamed(route);
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child:  Scaffold(
        body: Column(

          children: [
            SizedBox(height: Dimensions.height30),
            Padding(
              padding:  EdgeInsets.all(Dimensions.height10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  BigText(text: 'MED LIFE' ),
                  SizedBox(width: Dimensions.width10/2,),
                  Icon(Icons.local_hospital, color: AppColors.grey, )
                ],
              ),
            ),
            SizedBox(height: Dimensions.height10/3,),
            SizedBox(height: Dimensions.height10/2, child: Divider(thickness: 1, color: AppColors.black,),),
            SizedBox(height: Dimensions.height15,),
            TabBar(
            indicatorColor: Colors.black,
            tabs: <Widget>[
              Tab(child: Text('Overview', style: TextStyle(color: Colors.black),)),
              Tab(child: Text('Booking Requests Page',style: TextStyle(color: Colors.black), )),
              Tab(child: Text('Approved Requests Page',style: TextStyle(color: Colors.black), )),
            ],
          ),
            Expanded(
              child: TabBarView(
                  children: [
                    OverviewPage(),
                    BookingRequestsPage(),
                    ApprovedRequestsPage(),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}