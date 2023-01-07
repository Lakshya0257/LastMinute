// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:location/location.dart';
class HomepageStaffController extends GetxController {
  RxBool isLoading = true.obs;
  Location location = Location();
  LatLng? currentLocation;
  late bool _serviceEnabled;
  late StreamController<LatLng> latLng = StreamController();
  //location
  TextEditingController enterLocation = TextEditingController();
  final selectedAddress =
      'Nehru Colony, Something Something, SomeCity, India'.obs;
  onChangedselectedAddress(String addressLocation) {
    selectedAddress(addressLocation);
  }

 
  final _patientAssigned = false.obs;
  bool get patientAssigned => _patientAssigned.value;
  final _patientId=''.obs;
  String get patientId=>_patientId.value;

  DocumentSnapshot<Map<String, dynamic>>? document;
  onAmbulanceBooked(bool x,String y)async {
    if(x==false){
      polylineCoordinates.clear();
      _patientAssigned(x);
    _patientId(y);
      update();
    }
    if(x=true&&y!=''){
      _patientAssigned(x);
    _patientId(y);
      document=await FirebaseFirestore.instance.collection('users').doc(y).get();
      
      update();
    }
    
  }
 
  @override
  void onInit() {
    getpermission();
    getCurrentLocation();
    super.onInit();
  }

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLocation = (LatLng(location.latitude!, location.longitude!));
        latLng.add(currentLocation!);
        log("Got Current Location");
        isLoading.value = false;
      },
    );
  }

  void getpermission() async {
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        debugPrint('Location Denied once');
      }
    }
  }

  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    polylineCoordinates.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        'AIzaSyCAYnuFO2kwBTN2qpa22yV51fglehTdnP8',
        PointLatLng(
            patientLocation.latitude, patientLocation.longitude),
        PointLatLng(driverLocation.latitude, driverLocation.longitude));

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        update();
      }
    }
  }

  final _patientLocation = const LatLng(0, 0).obs;
  LatLng get patientLocation => _patientLocation.value;
  final _driverLocation = const LatLng(0, 0).obs;
  LatLng get driverLocation => _driverLocation.value;
  
  final _time=''.obs;
  String get time=>_time.value;

  onGetPatientLocation(double patientLat,double patientLng,double driverLat,double driverLng,String estimatedTime){
    
    _patientLocation(LatLng(patientLat,
        patientLng));
        //_time(estimatedTime);
        _driverLocation(LatLng(driverLat, driverLng));
        //_bookedPatientId(userId);
    getPolyPoints();
    //onUpdateLocationFirebase();
  }

  
}
