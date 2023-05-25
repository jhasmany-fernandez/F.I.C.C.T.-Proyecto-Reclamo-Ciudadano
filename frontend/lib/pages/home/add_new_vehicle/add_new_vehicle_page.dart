import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';

import '../../../utils/widgets.dart';

class AddNewVehiclePage extends StatefulWidget {
  const AddNewVehiclePage({Key? key}) : super(key: key);

  @override
  State<AddNewVehiclePage> createState() => _AddNewVehiclePageState();
}

List vehicleTypesList = [
  'Sedan',
  'Coupe',
  'Sports Car',
  'Station Wagon',
  'Hatchback',
  'Convertible',
  'Sport-Utility Vehicle',
];

class _AddNewVehiclePageState extends State<AddNewVehiclePage> {
  Object? dropDownValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Add New Vehicle',
          )),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                heightSpace20,
                MyContainerWithChild(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton(
                      value: dropDownValue,
                      iconEnabledColor: color94,
                      isExpanded: true,
                      items: vehicleTypesList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e, style: color94Regular14),
                              ))
                          .toList(),
                      hint: Text('Vehicle Type', style: color94Regular14),
                      onChanged: (Object? value) {
                        setState(() {});
                        dropDownValue = value!;
                      },
                    ),
                  ),
                ),
                heightSpace15,
                MyContainerWithChild(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    style: color94Regular15,
                    cursorColor: primaryColor,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Vehicle Name',
                      hintStyle: color94Regular14,
                    ),
                  ),
                ),
                heightSpace15,
                MyContainerWithChild(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: TextField(
                    style: color94Regular15,
                    cursorColor: primaryColor,
                    textInputAction: TextInputAction.done,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Vehicle Number',
                      hintStyle: color94Regular14,
                    ),
                  ),
                ),
                heightSpace40,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: PrimaryButton(
                    text: 'Add',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
