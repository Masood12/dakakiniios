import 'dart:async';

import 'package:dakakini/models/user_shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationScreen extends StatefulWidget {
  final Datum shopDetail;
  LocationScreen({this.shopDetail});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );
  GoogleMapController _controller;
  Set<Marker> markers = Set();
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      add();
    });
    super.initState();
  }

  void add() {
    for (int i = 0; i < widget.shopDetail.shopLocation.length; i++) {
      LatLng latLng = LatLng(widget.shopDetail.shopLocation[i].lat,
          widget.shopDetail.shopLocation[i].lng);
      if (i == 0) moveCamera(latLng);
      Marker resultMarker = Marker(
        icon: BitmapDescriptor.defaultMarker,
        markerId: MarkerId(i.toString()),
        position: latLng,
      );
      markers.add(resultMarker);
    }
    setState(() {});
  }

  moveCamera(LatLng latLng) {
    _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: latLng, zoom: 10.0)));
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller = controller;
      },
    );
  }
}
