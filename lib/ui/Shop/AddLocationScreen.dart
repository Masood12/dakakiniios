import 'dart:convert';

import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const double CAMERA_ZOOM = 10;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;

class AddLocationScreen extends StatefulWidget {
  final Datum shopDetail;
  AddLocationScreen({this.shopDetail});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<AddLocationScreen> {
  GoogleMapController _controller;
  Set<Marker> markers = Set();
  LatLng shopLatLng;
  
  @override
  void initState() {
    if (widget.shopDetail.shopLocation.length > 0)
      shopLatLng = LatLng(widget.shopDetail.shopLocation[0].lat,
          widget.shopDetail.shopLocation[0].lng);
    else
      shopLatLng = LatLng(25.2048, 55.2708);
    super.initState();
  }

  void add() {
    Marker resultMarker = Marker(
      icon: BitmapDescriptor.defaultMarker,
      markerId: MarkerId("Hello"),
      position: shopLatLng,
    );
    setState(() {
      markers.add(resultMarker);
    });
    moveCamera(shopLatLng);
  }

  moveCamera(LatLng latLng) {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 18.0)));
  }

  void onMapCreated(controller) {
    setState(() {
      _controller = controller;
    });
    add();
  }

  @override
  Widget build(BuildContext context) {
    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: shopLatLng);

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Shop Location"),
        centerTitle: true,
        backgroundColor: colorMain,
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        compassEnabled: true,
        tiltGesturesEnabled: false,
        zoomControlsEnabled: false,
        markers: markers,
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        onMapCreated: onMapCreated,
        onTap: (latlng) {
          print("Hello::::    $latlng");
          _handleTap(latlng);
        },
      ),
    );
  }

  _handleTap(LatLng point) {
    markers.clear();
    setState(() {
      markers.add(Marker(
        markerId: MarkerId("asd"),
        position: point,
        infoWindow: InfoWindow(
          title: 'I am a marker',
        ),
        icon:
            BitmapDescriptor.defaultMarker,
      ));
    });
  }
}
