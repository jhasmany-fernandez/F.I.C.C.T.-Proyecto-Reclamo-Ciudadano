import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';

import '../../../utils/constant.dart';

class MyVehiclePage extends StatefulWidget {
  const MyVehiclePage({Key? key}) : super(key: key);

  @override
  State<MyVehiclePage> createState() => _MyVehiclePageState();
}

List myVehiclesList = [
  {
    'image': bookSlotCar,
    'title': 'Toyota Matrix',
    'subtitle': 'Hatchback | GJ05NC1710',
  },
  {
    'image': myVehicle2,
    'title': 'RNX Dulex',
    'subtitle': 'Sports car | GJ05NC2508',
  },
  {
    'image': myVehicle3,
    'title': 'Baleno',
    'subtitle': 'Hatchback | GJ05NC1017',
  },
];

class _MyVehiclePageState extends State<MyVehiclePage> {
  int _selectedVehicle = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'My Vehicles',
          )),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                heightSpace20,
                ...myVehiclesList.map((e) {
                  var index = myVehiclesList.indexOf(e);
                  return MyContainerWithChild(
                    color: _selectedVehicle == index ? primaryColor : white,
                    onTap: () {
                      setState(() {
                        _selectedVehicle = myVehiclesList.indexOf(e);
                      });
                    },
                    margin: const EdgeInsets.only(bottom: 15),
                    padding: const EdgeInsets.fromLTRB(10, 3.5, 0, 3.5),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e['title'],
                                  style: _selectedVehicle != index
                                      ? blackRegular14
                                      : whiteRegular14),
                              Text(e['subtitle'],
                                  style: _selectedVehicle == index
                                      ? whiteMedium12
                                      : color94Medium12),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                            child: Image.asset(e['image']),
                          )
                        ]),
                  );
                }),
                heightSpace40,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: PrimaryButton(
                    text: 'Add New Vehicle',
                    onTap: () {
                      Navigator.pushNamed(context, '/AddNewVehiclePage');
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
