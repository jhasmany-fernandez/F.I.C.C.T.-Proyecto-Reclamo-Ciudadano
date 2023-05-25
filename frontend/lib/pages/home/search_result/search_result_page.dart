import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rc_fl_parkingspot/pages/home/filter/filter_sheet.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';
import 'dart:ui' as ui;
import '../../../utils/constant.dart';

class SearchResultPage extends StatefulWidget {
  const SearchResultPage({Key? key}) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final Completer<GoogleMapController> googleMapController = Completer();
  final TextEditingController searchController =
      TextEditingController(text: 'New york');
  final List _imageList = [
    dollar5,
    dollar3,
    dollar4,
    dollar3,
    dollar2,
    dollar6,
    dollar2,
    dollar5,
    dollar3,
  ];
  final List<LatLng> _latlng = [
    const LatLng(37.763597, -122.417394),
    const LatLng(37.771318, -122.407898),
    const LatLng(37.801585, -122.405720),
    const LatLng(37.793446, -122.424774),
    const LatLng(37.784252, -122.414303),
    const LatLng(37.785899, -122.396177),
    const LatLng(37.774206, -122.394277),
    const LatLng(37.776402, -122.423557),
    const LatLng(37.756385, -122.408876),
  ];
  final List<Marker> _markers = [];
  static const CameraPosition _sourceLocation =
      CameraPosition(target: LatLng(37.785591, -122.406331), zoom: 13.5);

  @override
  void initState() {
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  loadData() async {
    for (int i = 0; i < _imageList.length; i++) {
      final Uint8List markerIcon = await getBytesFromAssets(_imageList[i], 110);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: appBarMethod(),
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
        ],
      ),
    );
  }

  PreferredSize appBarMethod() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(76),
      child: AppBar(
        toolbarHeight: 76,
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
                      controller: searchController,
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
                        searchController.clear();
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
            MyContainerWithChild(
              onTap: () {
                openFilterSheet();
              },
              margin: const EdgeInsets.only(right: 20),
              padding: const EdgeInsets.all(13),
              child: SizedBox(height: 2.5.h, child: Image.asset(filter)),
            )
          ],
        ),
      ),
    );
  }

  void openFilterSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      context: context,
      builder: (context) {
        return const FilterSheet();
      },
    );
  }
}
