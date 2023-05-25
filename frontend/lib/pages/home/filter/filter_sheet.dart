import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

List facilitiesList = [
  'Convered Roof',
  'Camera',
  'Charging',
  'Overnight',
  'Disabled Parking',
];
List durationList = ['More than 2 hours', '1 - 2 hrs', '<1 hour'];
List distanceList = ['Within 1 km', '2 - 3 km', '4 - 6 km'];
List ratingList = [5, 4, 3, 2, 1];

class _FilterSheetState extends State<FilterSheet> {
  SfRangeValues _values = const SfRangeValues(5.0, 20.0);
  int _selectedFacilities = 0;
  int _selectedRating = 0;
  int _selectedDistance = 0;
  int _selectedDuration = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        heightSpace20,
        const Center(
            child: SizedBox(
                width: 120, child: Divider(color: primaryColor, thickness: 2))),
        heightSpace5,
        Center(child: Text('Filter', style: blackMedium18)),
        heightSpace20,
        ...priceMethod(),
        heightSpace20,
        facilitiesMethod(),
        heightSpace10,
        ratingMethod(),
        heightSpace20,
        distanceMethod(),
        heightSpace20,
        durationMethod(),
        heightSpace40,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  text: 'Apply',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/FilterResultPage');
                  },
                ),
              ),
              widthSpace30,
              GestureDetector(
                onTap: () {
                  setState(() {});
                  _values = const SfRangeValues(5.0, 20.0);
                  _selectedFacilities = 0;
                  _selectedRating = 0;
                  _selectedDistance = 0;
                  _selectedDuration = 0;
                },
                child: Text(
                  'Clear All',
                  style: color94Bold16,
                ),
              )
            ],
          ),
        ),
        heightSpace30,
      ],
    );
  }

  priceMethod() {
    return [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Text('Price', style: blackRegular16),
      ),
      SfRangeSlider(
        min: 0.0,
        max: 50.0,
        values: _values,
        interval: 5,
        activeColor: primaryColor,
        inactiveColor: colorE6,
        enableTooltip: true,
        tooltipShape: const SfRectangularTooltipShape(),
        numberFormat: NumberFormat("\$"),
        onChanged: (SfRangeValues newValues) {
          setState(() {
            _values = newValues;
          });
        },
      ),
    ];
  }

  facilitiesMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Facilities', style: blackRegular16),
          heightSpace10,
          Wrap(
              children: facilitiesList
                  .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {});
                          _selectedFacilities = facilitiesList.indexOf(e);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(right: 13, bottom: 12),
                          decoration: BoxDecoration(
                              borderRadius: borderRadius5,
                              border: Border.all(
                                  color: _selectedFacilities ==
                                          facilitiesList.indexOf(e)
                                      ? primaryColor
                                      : color94)),
                          padding:
                              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Text(e,
                              style: _selectedFacilities ==
                                      facilitiesList.indexOf(e)
                                  ? primaryRegular14
                                  : color94Regular14),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }

  ratingMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Rating', style: blackRegular16),
          heightSpace10,
          Row(
              children: ratingList
                  .map((e) => Expanded(
                        child: GestureDetector(
                          onTap: () {
                            setState(() {});
                            _selectedRating = ratingList.indexOf(e);
                          },
                          child: Container(
                            margin: ratingList.indexOf(e) == 0
                                ? const EdgeInsets.only(right: 5)
                                : ratingList.indexOf(e) == 4
                                    ? const EdgeInsets.only(left: 5)
                                    : const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                                borderRadius: borderRadius5,
                                border: Border.all(
                                    color:
                                        _selectedRating == ratingList.indexOf(e)
                                            ? primaryColor
                                            : color94)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(e.toString(),
                                    style:
                                        _selectedRating == ratingList.indexOf(e)
                                            ? primaryRegular14
                                            : color94Regular14),
                                widthSpace2,
                                SizedBox(height: 1.h, child: Image.asset(star))
                              ],
                            ),
                          ),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }

  distanceMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Distance', style: blackRegular16),
          heightSpace10,
          Row(
              children: distanceList
                  .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {});
                          _selectedDistance = distanceList.indexOf(e);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: borderRadius5,
                              border: Border.all(
                                  color: _selectedDistance ==
                                          distanceList.indexOf(e)
                                      ? primaryColor
                                      : color94)),
                          padding:
                              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(e.toString(),
                                  style: _selectedDistance ==
                                          distanceList.indexOf(e)
                                      ? primaryRegular14
                                      : color94Regular14),
                              widthSpace2,
                              SizedBox(height: 1.h, child: Image.asset(star))
                            ],
                          ),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }

  durationMethod() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Duration', style: blackRegular16),
          heightSpace10,
          Row(
              children: durationList
                  .map((e) => GestureDetector(
                        onTap: () {
                          setState(() {});
                          _selectedDuration = durationList.indexOf(e);
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 5),
                          decoration: BoxDecoration(
                              borderRadius: borderRadius5,
                              border: Border.all(
                                  color: _selectedDuration ==
                                          durationList.indexOf(e)
                                      ? primaryColor
                                      : color94)),
                          padding:
                              const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(e.toString(),
                                  style: _selectedDuration ==
                                          durationList.indexOf(e)
                                      ? primaryRegular14
                                      : color94Regular14),
                              widthSpace2,
                              SizedBox(height: 1.h, child: Image.asset(star))
                            ],
                          ),
                        ),
                      ))
                  .toList())
        ],
      ),
    );
  }
}
