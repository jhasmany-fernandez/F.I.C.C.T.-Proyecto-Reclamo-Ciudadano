import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<GoogleMapController> googleMapController = Completer();
  final List _imageList = [youHere];
  final List<LatLng> _latlng = [
    const LatLng(37.785591, -122.406331),
  ];
  final List<Marker> _markers = [];
  static const CameraPosition _sourceLocation =
      CameraPosition(target: LatLng(37.785591, -122.406331), zoom: 13.5);

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    for (int i = 0; i < _imageList.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(_imageList[i], 180);
      _markers.add(Marker(
        icon: BitmapDescriptor.fromBytes(markerIcon),
        markerId: MarkerId(i.toString()),
        position: _latlng[i],
        onTap: () {},
      ));
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

  void _currentLocation() async {
    final GoogleMapController controller = await googleMapController.future;

    controller.animateCamera(CameraUpdate.newCameraPosition(
      const CameraPosition(
        bearing: 0,
        target: LatLng(37.785591, -122.406331),
        zoom: 14.0,
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: white,
        onPressed: _currentLocation,
        child: const Icon(
          Icons.my_location_outlined,
          color: black,
        ),
      ),
      body: Stack(
        children: [
          GoogleMap(
            zoomControlsEnabled: false,
            myLocationButtonEnabled: false,
            initialCameraPosition: _sourceLocation,
            mapType: MapType.normal,
            onMapCreated: (controller) {
              googleMapController.complete(controller);
            },
            myLocationEnabled: false,
            markers: Set<Marker>.of(_markers),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/SearchPage');
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 80),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: MyContainerWithChild(
                        padding:
                            const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Row(children: [
                          SizedBox(
                            height: 2.h,
                            child: Image.asset(
                              searchYellow,
                            ),
                          ),
                          widthSpace10,
                          Text('Search location here...',
                              style: color94Regular14)
                        ]),
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
