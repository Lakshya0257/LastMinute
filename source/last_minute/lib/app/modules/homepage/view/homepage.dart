// ignore_for_file: must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last_minute/app/modules/ambulance_details/controller/ambulance_controller.dart';
import 'package:last_minute/app/modules/ambulance_details/view/additional_details.dart';
import 'package:last_minute/app/modules/ambulance_details/view/ambulance_details.dart';
import 'package:last_minute/app/modules/homepage/controller/homepage_controller.dart';
import 'package:last_minute/app/modules/homepage/view/panel_widget.dart';
import 'package:last_minute/utils/colors.dart';
import 'package:last_minute/utils/dimensions.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../../helper/snackbar.dart';

class Homepage extends GetView<HomepageController> {
 // HomepageController controller = Get.find();
  AmbulanceDetailsController ambulanceController = Get.find();
  Completer<GoogleMapController> mapController = Completer();

  static const route = '/homepage';
  bool booked=false;
  Homepage({super.key,this.booked=false});
  static launch() => Get.toNamed(route);
  final panelController = PanelController();

  void _onMapCreated(GoogleMapController controller) {
    mapController.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    //HomepageController controller = Get.find();
    controller.ambulanceBookedBool(booked);
    return MaterialApp(
      home: Scaffold(
          body: SafeArea(
            child: Obx(
                  () => controller.ambulanceBooked
              ? GetBuilder<AmbulanceDetailsController>(
                  builder: (ambulanceController) {
                  return SlidingUpPanel(
                    maxHeight: ambulanceController.additionalData
                        ? Dimensions.height40 * 17
                        : Dimensions.height40 * 12,
                    controller: panelController,
                    borderRadius: BorderRadius.circular(Dimensions.radius30),
                    panelBuilder: (controller) => 
                        ambulanceController.additionalData
                            ? AdditionalData(
                                scrollController: controller,
                              )
                            : AmbulanceDetails(
                                scrollController: controller,
                              ),
                    body: Stack(
                      alignment: Alignment.center,
                      children: [
                        renderMap(),
                      ],
                    ),
                  );
                })
              : SlidingUpPanel(
                  maxHeight: Dimensions.height40 * 6,
                  minHeight: Dimensions.height40 * 6,
                  isDraggable: false,
                  controller: panelController,
                  borderRadius: BorderRadius.circular(Dimensions.radius30),
                  panelBuilder: (controller) => PanelWidget(),
                  body: renderMap()),
                ),
          )),
    );
  }

  Widget renderMap() {
    return Obx((() => (controller.isLoading.value)
        ? const Center(
            child: CircularProgressIndicator(color: AppColors.pink),
          )
        : SizedBox(
          child:GetBuilder<HomepageController>(
          builder: (_) {
            return GoogleMap(
               //onCameraIdle: controller.onCameraIdle, 
              mapType: MapType.normal,
              onMapCreated: _onMapCreated,                    
              initialCameraPosition: CameraPosition(
                target: LatLng(controller.currentLocation!.latitude!,
                    controller.currentLocation!.longitude!),
                zoom: 13.5,
              ),
              onCameraMove: (positioned) {
              controller.latLng.add(positioned.target);
            },
              markers: {
                if (controller.ambulanceBooked)
                  Marker(
                    onTap: () {
                      snackbar('Ambulance Location');
                    },
                      markerId: const MarkerId('driverLocation'),
                      position: controller.destinationLocation),
                Marker(
                  onTap: () {
                    snackbar('Your Location');
                  },
                  markerId: const MarkerId('patientLocation'),
                  position: LatLng(controller.currentLocation!.latitude!,
                      controller.currentLocation!.longitude!),
                )
              },
              polylines: {
                if(controller.ambulanceBooked) Polyline(
                    polylineId: const PolylineId('route'),
                    points: controller.polylineCoordinates,
                    color: AppColors.pink,
                    width: 6)
              },
            );
          },
        )
        )));
  }
}
