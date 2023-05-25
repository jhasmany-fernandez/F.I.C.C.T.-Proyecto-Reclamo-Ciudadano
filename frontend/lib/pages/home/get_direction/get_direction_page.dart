import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui' as ui;

import '../../../utils/constant.dart';
import '../../../utils/key.dart';

class GetDirectionPage extends StatefulWidget {
  const GetDirectionPage({Key? key}) : super(key: key);

  @override
  State<GetDirectionPage> createState() => _GetDirectionPageState();
}

List _imageList = [
  locationOnRoad,
  carOnRoad,
];
final List<Marker> _markers = [];
final List<LatLng> _latlng = [
  const LatLng(37.770965451825184, -122.40811530500652),
  const LatLng(37.756385, -122.408876),
];

class _GetDirectionPageState extends State<GetDirectionPage> {
  final firstTextFieldController = TextEditingController();
  final secTextFieldController = TextEditingController(text: 'Lawnfield Parks');
  final Completer<GoogleMapController> googleMapController = Completer();
  static const CameraPosition _sourceLocation =
      CameraPosition(target: LatLng(37.785591, -122.406331), zoom: 13.5);
  LatLng soureLocation = const LatLng(37.770965451825184, -122.40811530500652);
  LatLng destination = const LatLng(37.756385, -122.408876);
  List<LatLng> polylineCoordinates = [];

  @override
  void initState() {
    getPolyPoints();
    loadData();
    super.initState();
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleMapApiKey,
        PointLatLng(soureLocation.latitude, soureLocation.longitude),
        PointLatLng(destination.latitude, destination.longitude));
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        setState(() {});
      }
    }
  }

  loadData() async {
    for (int i = 0; i < _imageList.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(_imageList[i], 130);
      _markers.add(
        Marker(
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: MarkerId(i.toString()),
          position: _latlng[i],
        ),
      );
    }
    if (mounted) {
      setState(() {});
    }
  }

  Future<Uint8List> getBytesFromAssets(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: appBarMethod(context),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            initialCameraPosition: _sourceLocation,
            mapType: MapType.normal,
            onMapCreated: (controller) {
              googleMapController.complete(controller);
            },
            myLocationButtonEnabled: false,
            myLocationEnabled: false,
            markers: Set<Marker>.of(_markers),
            polylines: {
              Polyline(
                  color: Colors.blue,
                  width: 4,
                  polylineId: const PolylineId("route"),
                  points: polylineCoordinates),
            },
          ),
          Container(
            width: 100.w,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
                color: white,
                boxShadow: [BoxShadow(blurRadius: 5, color: colorForShadow)],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                heightSpace15,
                Text('Lawnfield Parks', style: blackMedium18),
                Text('3891 Ranchview Dr. Richardson, California 62639',
                    style: color94Regular14),
                heightSpace15,
                heightSpace2,
                const SizedBox(
                  width: 90,
                  child: PrimaryButton(
                    text: 'Start',
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 23),
                  ),
                ),
                heightSpace20,
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar appBarMethod(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      )),
      toolbarHeight: 150,
      backgroundColor: primaryColor,
      systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Align(
          alignment: const Alignment(.5, -.53),
          child: Icon(
            Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back,
            color: white,
          ),
        ),
      ),
      title: Row(children: [
        Column(
          children: [
            const Icon(Icons.my_location, color: white),
            heightSpace2,
            SizedBox(height: 4.5.h, child: Image.asset(verticalDots)),
            heightSpace2,
            const Icon(Icons.location_on_outlined, color: white)
          ],
        ),
        widthSpace15,
        Expanded(
            child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: white),
              child: TextField(
                controller: firstTextFieldController,
                style: blackRegular16,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Your location',
                    hintStyle: blackRegular16),
              ),
            ),
            heightSpace20,
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              margin: const EdgeInsets.only(right: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: white),
              child: TextField(
                controller: secTextFieldController,
                style: blackRegular16,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Choose destination',
                    hintStyle: blackRegular16),
              ),
            ),
          ],
        ))
      ]),
    );
  }
}
