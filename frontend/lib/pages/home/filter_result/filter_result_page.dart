import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rc_fl_parkingspot/utils/key.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constant.dart';

class FilterResultPage extends StatefulWidget {
  const FilterResultPage({Key? key}) : super(key: key);

  @override
  State<FilterResultPage> createState() => _FilterResultPageState();
}

List stationList = [
  {
    'image': pageviewStation1,
    'title': 'Hauz Khas',
    'subtitle1': 'Thornridge cir.shiloh, hawaii',
    'subtitle2': '150 spots • \$3.0/h',
    'distance': '0.5km'
  },
  {
    'image': pageviewStation2,
    'title': 'Lawnfield Parks',
    'subtitle1': 'Westheimer rd.santa ana,illinois',
    'subtitle2': '50 spots • \$2.0/h',
    'distance': '1km'
  },
  {
    'image': pageviewStation3,
    'title': 'Peterson Tower',
    'subtitle1': 'Preston rd.inglewood,maine',
    'subtitle2': '120 spots • \$5.0/h',
    'distance': '2km'
  },
  {
    'image': pageviewStation4,
    'title': 'Operum Shopping',
    'subtitle1': 'Ash Dr.san jose,south dakota',
    'subtitle2': '100 spots • \$4.0/h',
    'distance': '2.5km'
  },
  {
    'image': pageviewStation1,
    'title': 'Hauz Khas',
    'subtitle1': 'Thornridge cir.shiloh, hawaii',
    'subtitle2': '150 spots • \$3.0/h',
    'distance': '0.5km'
  },
  {
    'image': pageviewStation2,
    'title': 'Lawnfield Parks',
    'subtitle1': 'Westheimer rd.santa ana,illinois',
    'subtitle2': '50 spots • \$2.0/h',
    'distance': '1km'
  },
  {
    'image': pageviewStation3,
    'title': 'Peterson Tower',
    'subtitle1': 'Preston rd.inglewood,maine',
    'subtitle2': '120 spots • \$5.0/h',
    'distance': '2km'
  },
  {
    'image': pageviewStation4,
    'title': 'Operum Shopping',
    'subtitle1': 'Ash Dr.san jose,south dakota',
    'subtitle2': '100 spots • \$4.0/h',
    'distance': '2.5km'
  },
  {
    'image': pageviewStation4,
    'title': 'Operum Shopping',
    'subtitle1': 'Ash Dr.san jose,south dakota',
    'subtitle2': '100 spots • \$4.0/h',
    'distance': '2.5km'
  },
];
List _imageList = [
  dollar5,
  youHere,
  dollar4,
  dollar3,
  dollar2,
  dollar6,
  dollar2,
  dollar5,
  dollar3,
];
final List<Marker> _markers = [];
final List<LatLng> _latlng = [
  const LatLng(37.763597, -122.417394),
  const LatLng(37.770965451825184, -122.40811530500652),
  const LatLng(37.801585, -122.405720),
  const LatLng(37.793446, -122.424774),
  const LatLng(37.784252, -122.414303),
  const LatLng(37.785899, -122.396177),
  const LatLng(37.774206, -122.394277),
  const LatLng(37.776402, -122.423557),
  const LatLng(37.756385, -122.408876),
];

class _FilterResultPageState extends State<FilterResultPage> {
  final TextEditingController _searchController = TextEditingController();
  final PageController _pageController = PageController(viewportFraction: .75);
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

  @override
  void dispose() {
    _searchController.dispose();
    _pageController.dispose();
    super.dispose();
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
      final Uint8List markerIcon =
          await getBytesFromAssets(_imageList[i], i == 1 ? 140 : 110);
      _markers.add(
        Marker(
          icon: BitmapDescriptor.fromBytes(markerIcon),
          markerId: MarkerId(i.toString()),
          position: _latlng[i],
          draggable: false,
          onTap: () async {
            polylineCoordinates.clear();
            PolylinePoints polylinePoints = PolylinePoints();
            PolylineResult result =
                await polylinePoints.getRouteBetweenCoordinates(
                    googleMapApiKey,
                    PointLatLng(
                        soureLocation.latitude, soureLocation.longitude),
                    PointLatLng(_latlng[i].latitude, _latlng[i].longitude));
            if (result.points.isNotEmpty) {
              for (var point in result.points) {
                polylineCoordinates
                    .add(LatLng(point.latitude, point.longitude));
                setState(() {});
              }
            }

            _pageController.animateToPage(i,
                duration: const Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn);
          },
          infoWindow: i == 1
              ? const InfoWindow(title: "You are here")
              : InfoWindow(
                  title: stationList[i]['title'],
                  snippet: stationList[i]['subtitle1'],
                ),
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
      appBar: appBarMethod(),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
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
            Positioned(
              bottom: 20,
              child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  height: 125,
                  width: 100.w,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: stationList.length,
                    onPageChanged: (value) async {
                      GoogleMapController controller =
                          await googleMapController.future;
                      controller.animateCamera(CameraUpdate.newCameraPosition(
                          CameraPosition(target: _latlng[value], zoom: 13.5)));
                    },
                    itemBuilder: (context, index) {
                      var item = stationList[index];
                      return MyContainerWithChild(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/ParkingPlaceDetailPage');
                          },
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        image: AssetImage(item['image']))),
                              ),
                              widthSpace10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(item['title'], style: blackMedium14),
                                  heightSpace5,
                                  Text(
                                    item['subtitle1'],
                                    style: color94Regular12,
                                  ),
                                  heightSpace5,
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 2.h,
                                          child: Image.asset(yellowCar)),
                                      widthSpace2,
                                      Text(
                                        item['subtitle2'],
                                        style: primaryMedium12,
                                      ),
                                    ],
                                  ),
                                  heightSpace3,
                                  Row(
                                    children: [
                                      SizedBox(
                                          height: 2.3.h,
                                          child: Image.asset(greyNavigation)),
                                      Text(item['distance'],
                                          style: color94Regular12),
                                    ],
                                  ),
                                ],
                              )
                            ],
                          ));
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }

  PreferredSize appBarMethod() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(76),
      child: AppBar(
        toolbarHeight: 76,
        automaticallyImplyLeading: true,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(left: 20, right: 10),
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                  borderRadius: borderRadius10,
                  boxShadow: [myBoxShadow],
                  color: white,
                ),
                child: Row(
                  children: [
                    SizedBox(
                      height: 1.7.h,
                      child: Image.asset(searchYellow),
                    ),
                    widthSpace10,
                    Expanded(
                        child: TextField(
                      controller: _searchController,
                      cursorColor: primaryColor,
                      style: color94Regular14,
                      textInputAction: TextInputAction.search,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search loaction',
                          hintStyle: color94Regular14),
                    )),
                    InkWell(
                      onTap: () {
                        _searchController.clear();
                      },
                      child: Icon(
                        Icons.close,
                        color: color94,
                        size: 2.h,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
