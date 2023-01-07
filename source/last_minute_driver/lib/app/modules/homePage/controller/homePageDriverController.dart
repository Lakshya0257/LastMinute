// ignore_for_file: file_names

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last_minute_driver/app/data/model/distance.dart';
import 'package:last_minute_driver/app/data/model/repo_response.dart';
import 'package:last_minute_driver/app/data/repo/distance_repo.dart';

import 'package:location/location.dart';

class HomepageDriverController extends GetxController {
  Location location = Location();
  LocationData? currentLocation;
  late bool _serviceEnabled;
  DistanceRepository repo=DistanceRepository();

  // late LatLng selectedLatLng;
  // late LatLng selectedLatLng;
  // late StreamController<LatLng> latLng = StreamController.broadcast();
  late List<geocoding.Placemark> placemarks;
  RxString? selectedAddress = "Loading".obs;

  RxString estimatedTime = '15:03 PM'.obs;
  RxBool isLoading = true.obs;
  late PermissionStatus _permissionGranted;
  //location
  TextEditingController enterLocation = TextEditingController();

  onChangedselectedAddress(String addressLocation) {
    selectedAddress!(addressLocation);
  }

  //nextPage
  final _patientAssigned = false.obs;
  final _bookedPatientId = ''.obs;
  String get bookedPatientId => _bookedPatientId.value;
  bool get patientAssigned => _patientAssigned.value;
  DocumentSnapshot<Map<String, dynamic>>? document;
  onAmbulanceBooked(bool x, String bookedPatient)async {

    if(x==false){
      _patientAssigned(x);
    _bookedPatientId(bookedPatient);
      polylineCoordinates.clear();
      update();
    }
    if(x=true&&bookedPatient!=''){
      print(bookedPatient+'---');
      _patientAssigned(x);
    _bookedPatientId(bookedPatient);
      document=await FirebaseFirestore.instance.collection('users').doc(bookedPatient).get();
      update();
    }
    
     
  }

  @override
  void onReady() {
    getpermission();
    getCurrentLocation();
    super.onReady();
  }


  final Completer<GoogleMapController> mapControl = Completer();
  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
      (location) async {
        currentLocation = location;
        update();

        // latLng.add(currentLocation!);
        log("Got Current Location");
        isLoading.value = false;
      },
    );
    //GoogleMapController googleMapController=await mapControl.future;
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      //googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(newLoc.latitude!,newLoc.longitude!))));
      update();
      
      if(patientAssigned){
         getPolyPoints();
        onUpdateLocationFirebase();
      }
    });
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
            destinationLocation.latitude, destinationLocation.longitude),
        PointLatLng(currentLocation!.latitude!, currentLocation!.longitude!));

    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        update();
      }
    }
  }

  final _destinationLocation = const LatLng(0, 0).obs;
  LatLng get destinationLocation => _destinationLocation.value;
  
  final _time=''.obs;
  String get time=>_time.value;

  onUpdateLocationFirebase()async{
    RepoResponse<DistanceMatrix> response=await repo.getDistance(currentLocation!.latitude!, currentLocation!.longitude!, destinationLocation.latitude, destinationLocation.longitude);
    _time(response.data!.rows![0].elements![0].duration!.text!);
    FirebaseFirestore.instance.collection('bookings').doc(bookedPatientId).update({
        'ambulanceLocation':{
          'time':time,
        'lat':currentLocation!.latitude!,
        'lng':currentLocation!.longitude!,
        }
      }
    );
  }

  onGetPatientLocation(double lat,double lng) async {
    
    _destinationLocation(LatLng(lat,
        lng));
        //_bookedPatientId(userId);
    getPolyPoints();
    //onUpdateLocationFirebase();
  }
}
