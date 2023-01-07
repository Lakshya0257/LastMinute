// ignore_for_file: must_be_immutable, file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last_minute_driver/app/modules/homePage/view/panelWidgetDriver.dart';
import 'package:last_minute_driver/helper/shared_preference.dart';
import 'package:last_minute_driver/helper/snackbar.dart';
import 'package:last_minute_driver/widgets/big_text.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/dimensions.dart';
import '../../../../widgets/button.dart';
import '../../patientDetails/controller/patientDriverController.dart';
import '../../patientDetails/view/patientDetailsDriver.dart';
import '../controller/homePageDriverController.dart';

class HomepageDriver extends GetView<HomepageDriverController> {
  PatientDetailsDriverController patientController = Get.find();
  Completer<GoogleMapController> mapController = Completer();

  static const route = '/homepage-driver';
  bool patientAssign = false;
  String patient = '';
  HomepageDriver({super.key, this.patientAssign = false, this.patient = ''});
  static launch() => Get.toNamed(route);
  final panelController = PanelController();

  void _onMapCreated(GoogleMapController controller) {
    if (mapController.isCompleted) {
      mapController.complete(controller);
    }
  }

  @override
  Widget build(BuildContext context) {
    controller.onAmbulanceBooked(patientAssign, patient);
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
        child: Obx(
          () => controller.patientAssigned
              ? SlidingUpPanel(
                  maxHeight:
                      // patientController.additionaldata
                      //     ? Dimensions.height40 * 17
                      //     :
                      Dimensions.height40 * 11.8,
                  controller: panelController,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius30),
                      topRight: Radius.circular(Dimensions.radius30)),
                  panelBuilder: (panelController) =>
                      //patientController.additionaldata
                      // ? AdditionalData(
                      //     scrollController: controller,
                      //   )
                      // :
                      PatientDetailsDriver(
                    scrollController: panelController,
                    patientId: controller.bookedPatientId,
                  ),
                  body: Stack(
                    alignment: Alignment.center,
                    children: [
                      renderMap(),
                    ],
                  ),
                )
              : SlidingUpPanel(
                  maxHeight: Dimensions.height40 * 10,
                  minHeight: Dimensions.height40 * 10,
                  isDraggable: false,
                  controller: panelController,
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  panelBuilder: (controller) => PanelWidgetDriver(),
                  body: renderMap()),
        ),
      )),
    );
  }

  Widget renderMap() {
    return Obx((() => (controller.isLoading.value)
        ? const Center(
            child: CircularProgressIndicator(color: AppColors.orange),
          )
        : Stack(
            children: [
              SizedBox(child: GetBuilder<HomepageDriverController>(
                builder: (_) {
                  return GoogleMap( 
                    mapType: MapType.normal,

                    onMapCreated: _onMapCreated,
                    // onCameraIdle: controller.onCameraIdle,
                    // onCameraMove: (positioned) {
                    //   controller.latLng.add(positioned.target);
                    // },
                    initialCameraPosition: CameraPosition(
                      target: LatLng(controller.currentLocation!.latitude!,
                          controller.currentLocation!.longitude!),
                      zoom: 13.5,
                    ),
                    markers: {
                      if (controller.patientAssigned)
                        Marker(
                          onTap: () {
                            snackbar('Patient Location');
                          },
                            markerId: const MarkerId('PatientLocation'),
                            position: controller.destinationLocation),
                      Marker(
                        onTap: () {
                          snackbar('Your Location');
                        },
                        markerId: const MarkerId('driverLocation'),
                        position: LatLng(controller.currentLocation!.latitude!,
                            controller.currentLocation!.longitude!),
                      )
                    },
                    polylines: {
                      if(controller.patientAssigned) Polyline(
                          polylineId: const PolylineId('route'),
                          points: controller.polylineCoordinates,
                          color: AppColors.pink,
                          width: 6)
                    },
                  );
                },
              )),
              controller.patientAssigned
                  ? Positioned(
                      top: Dimensions.screenHeight / 2.4,
                      right: 0,
                      child: Obx(() => Column(
                        children: [
                          Container(
                            width: Dimensions.width40 * 5,
                                height: Dimensions.height40 * 1.1,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),color: AppColors.black),
                                child: Center(child: BigText(text: 'Key: '+SPController().getUserId().toString().substring(0,6),size: Dimensions.font20*0.8,color: AppColors.white,)),
                          ),
                          SizedBox(height: 20,),
                          Button(
                                on_pressed: () {},
                                text:
                                    '  Estimated Arrival: ${controller.time}',
                                color: AppColors.black,
                                textColor: AppColors.white,
                                width: Dimensions.width40 * 5,
                                height: Dimensions.height40 * 1.1,
                                textSize: Dimensions.font20 * 0.8,
                              ),
                        ],
                      )),
                    )
                  : const SizedBox(),
              // Align(
              //   alignment: Alignment.center,
              //   child: Image.asset(
              //     "assets/images/pin.png",
              //     height: 40,
              //   ),
              // )
            ],
          )));
  }
}
