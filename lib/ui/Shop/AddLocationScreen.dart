import 'dart:convert';

import 'package:dakakini/models/user_shop.dart';
import 'package:dakakini/store/get_category_store.dart';
import 'package:dakakini/utils/config.dart';
import 'package:dakakini/utils/loaders/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AddLocationScreen extends StatefulWidget {
  final Datum shopDetail;
  AddLocationScreen({this.shopDetail});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<AddLocationScreen> {
  GoogleMapController mapController;
  static const LatLng _center = const LatLng(25.2048, 55.2708);
  LatLng _initialPosition;
  LatLng latLng = _center;
  LatLng _positionForIdle;

  final Set<Marker> _markers = {};

  final store = GetShopStore();

  @override
  void initState() {
    // if (widget.shopDetail.shopLocation.length > 0)
    //   shopLatLng = LatLng(widget.shopDetail.shopLocation[0].lat,
    //       widget.shopDetail.shopLocation[0].lng);
    // else
    //   shopLatLng = LatLng(25.2048, 55.2708);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _getUserLocation();
      showMarkerOnCameraIdel(_initialPosition);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Shop Location"),
        centerTitle: true,
        backgroundColor: colorMain,
      ),
      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: Constant.curentLoc == null ? _center : Constant.curentLoc,
              zoom: 15.0,
            ),
            onMapCreated: onMapCreated,
            markers: _markers,
            myLocationEnabled: true,
            zoomControlsEnabled: false,
            myLocationButtonEnabled: true,
            onCameraMove: ((_position) => _updatePosition(_position)),
            onCameraIdle: () => showMarkerOnCameraIdel(_positionForIdle),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: submitLoc(),
            ),
          )
        ],
      ),
    );
  }

  void onMapCreated(controller) {
    setState(() {
      mapController = controller;
    });
  }

  void _getUserLocation() async {
    ProgressDialogDotted().showProgressDialog(context);
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    List<Placemark> placemark = await Geolocator()
        .placemarkFromCoordinates(position.latitude, position.longitude);

    setState(() {
      _positionForIdle =
          _initialPosition = LatLng(position.latitude, position.longitude);
      print('${placemark[0].name}');
      print('$_initialPosition');
      showMarkerOnCameraIdel(_initialPosition);
    });
    ProgressDialogDotted().hideProgressDialog(context);
  }

  submitLoc() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
//      padding: EdgeInsets.all(0.0),
      height: height40,
      width: MediaQuery.of(context).size.width,
      child: RaisedButton(
        onPressed: () async {
          ProgressDialogDotted().showProgressDialog(context);
          var address = await getAddress();
          store.shopID = widget.shopDetail.shopId;
          store.lat = _positionForIdle.latitude;
          store.lng = _positionForIdle.longitude;
          store.address = address;
          showAlertDialog(context, address);
          // Navigator.pop(context, address);
        },
        padding: EdgeInsets.all(0),
        color: colorMain,
        disabledColor: colorMain,
        textColor: Colors.white,
        disabledTextColor: Colors.white,
        child: Stack(
          // mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Text(
                'Submit',
                style: TextStyle(fontSize: buttonFontSize),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              // padding: const EdgeInsets.symmetric(horizontal: 0),
              // margin: EdgeInsets.fromLTRB(8, 5, 0, 5),
              margin: EdgeInsets.all(4),
              //   margin: EdgeInsets.all(0),
            ),
          ],
        ),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

  getAddress() async {
    final coordinates =
        new Coordinates(_positionForIdle.latitude, _positionForIdle.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    ProgressDialogDotted().hideProgressDialog(context);
    var first = addresses.first;
    print(first.addressLine);
    print(first.subLocality);
    print(first.countryName);
    print(first.locality);
    return first.addressLine;
  }

  void _updatePosition(CameraPosition _position) {
    _positionForIdle =
        LatLng(_position.target.latitude, _position.target.longitude);
    Marker marker = _markers.firstWhere(
        (p) => p.markerId == MarkerId('marker_2'),
        orElse: () => null);
    _markers.remove(marker);
  }

  showMarkerOnCameraIdel(LatLng _position) {
    _markers.add(
      Marker(
          markerId: MarkerId('marker_2'),
          position: LatLng(_position.latitude, _position.longitude),
          draggable: true,
          icon: BitmapDescriptor.defaultMarker),
    );
    setState(() {});
  }

  showAlertDialog(BuildContext context, address) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        store.validateAddLocationData(context);
      },
    );
    Widget cancelButton = FlatButton(
      child: Text("CANCEL"),
      onPressed: () {
        Navigator.pop(context);
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Confirm Shop Location"),
      content: Text("$address"),
      actions: [okButton, cancelButton],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
