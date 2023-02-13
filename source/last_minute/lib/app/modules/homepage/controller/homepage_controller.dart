// ignore_for_file: avoid_init_to_null

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:last_minute/helper/loading.dart';
import 'package:last_minute/helper/shared_preference.dart';
import 'package:location/location.dart';

class HomepageController extends GetxController {
  RxBool isLoading = true.obs;
  Location location = Location();
  LocationData? currentLocation;
  late bool _serviceEnabled;
 // late LatLng selectedLatLng;
  late StreamController<LatLng> latLng = StreamController.broadcast();
  //location
  TextEditingController enterLocation = TextEditingController();
  late List<geocoding.Placemark> placemarks;
  RxString? selectedAddress = "Loading".obs;
  onChangedselectedAddress(String addressLocation) {
    selectedAddress!(addressLocation);
  }

  //nextPage
  ambulanceBookedBool(bool x) {
    _ambulanceBooked(x);
    if(x==false){
      polylineCoordinates.clear();
      update();
    }
    
  }

  var driverDoc=null;
  var emtDoc=null;
  onGetDocuments(String driverId,String emtId)async{
    driverDoc=await FirebaseFirestore.instance.collection('driver').doc(driverId).get();
    if(emtId!=''){
      emtDoc=await FirebaseFirestore.instance.collection('staff').doc(emtId).get();
      
      update();
      print(emtDoc['name']);
    }
    
    update();
  }

  final _ambulanceBooked = false.obs;
  bool get ambulanceBooked => _ambulanceBooked.value;
  onAmbulanceBooked(bool x) async {
    LoadingUtils.showLoader();
    await FirebaseFirestore.instance
        .collection('bookings')
        .doc(SPController().getUserId())
        .set({

        'userId':SPController().getUserId(),

      'ambulanceStatus': 'not assigned',
      'location': {
        "lat": currentLocation!.latitude,
        "lng": currentLocation!.longitude,
        'time':''
      },
      'rideKey':'',
      'ambulanceDetails': {
        'driverId': '',
      },
      'emtId':'',
      'ambulanceLocation':{
        'lat':0.0,
        'lng':0.0,
        'time':''
      },
      'additionalData': {
        'preferredHospital': '',
        'hospitalType': 'Private and Public',
        'emergencyType': []
      },
      'medicalReport':{}
    });
    LoadingUtils.hideLoader();
    _ambulanceBooked(x);
  }

  @override
  void onInit() {
    // latLng.stream.listen((value) {
    //   selectedLatLng = LatLng(value.latitude, value.longitude);
    // });
    getpermission();
    getCurrentLocation();
    super.onInit();
  }

  onCameraIdle() async {
    log("Getting placemarks");
    placemarks = await geocoding.placemarkFromCoordinates(
        currentLocation!.latitude!, currentLocation!.longitude!);
    onChangedselectedAddress(
        "${placemarks[1].name!}, ${placemarks[2].name!}, ${placemarks[3].name!}, ${placemarks.first.name!}");
  }

  void getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then(
          (location) async {
        currentLocation = location;
        latLng.add(LatLng(currentLocation!.latitude!,currentLocation!.longitude!));
        log("Got Current Location");
        isLoading.value = false;
      },
    );
    location.onLocationChanged.listen((newLoc) {
      currentLocation = newLoc;
      //googleMapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(newLoc.latitude!,newLoc.longitude!))));
      update();
      
      if(ambulanceBooked){
         getPolyPoints();
        onUpdateLocationFirebase();
      }
      else{
        onCameraIdle();
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
    //RepoResponse<DistanceMatrix> response=await repo.getDistance(currentLocation!.latitude!, currentLocation!.longitude!, destinationLocation.latitude, destinationLocation.longitude);
    //_time(response.data!.rows![0].elements![0].duration!.text!);
    FirebaseFirestore.instance.collection('bookings').doc(SPController().getUserId()).update({
        'location':{
          'time':time,
        'lat':currentLocation!.latitude,
        'lng':currentLocation!.longitude,
        }
      }
    );
  }

  final _ambulanceAssigned=false.obs;
  bool get ambulanceAssigned=>_ambulanceAssigned.value;
  ambulanceAssignedBool(bool x) {
    
    _ambulanceAssigned(x);
  }

  onGetPatientLocation(double lat,double lng) async {
    
    
    _destinationLocation(LatLng(lat,
        lng));
        //_bookedPatientId(userId);
    getPolyPoints();
    //_ambulanceAssigned(true);
    //onUpdateLocationFirebase();
  }
}
