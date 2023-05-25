import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constant.dart';

class ParkingPlaceDetailPage extends StatefulWidget {
  const ParkingPlaceDetailPage({Key? key}) : super(key: key);

  @override
  State<ParkingPlaceDetailPage> createState() => _ParkingPlaceDetailPageState();
}

List reviewRatingList = [
  {
    'image': reviewer1,
    'user': 'Jane Cooper',
    'subtitle':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Justo feugiat viverra volutpat, vivamus.'
  },
  {
    'image': reviewer2,
    'user': 'Arlene McCoy',
    'subtitle':
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Justo feugiat viverra volutpat, vivamus.'
  }
];
List paymentTypeList = [
  {'image': wallet, 'title': 'Wallet'},
  {'image': cash, 'title': 'Pay on Spot'},
  {'image': cC, 'title': 'Credit Card'},
  {'image': pP, 'title': 'Paypal'},
];
List parkingRateList = [
  {'title': '30 min', 'subtitle': '\$3.00'},
  {'title': '1 hour', 'subtitle': '\$6.00'},
  {'title': '2 hour', 'subtitle': '\$8.00'},
  {'title': '4 hour', 'subtitle': '\$10.00'},
  {'title': '6 hour', 'subtitle': '\$14.00'},
  {'title': '8 hour', 'subtitle': '\$16.00'},
  {'title': '12 hour', 'subtitle': '\$20.00'},
];
List facilitieList = [facilities1, facilities2, facilities3, facilities4];

class _ParkingPlaceDetailPageState extends State<ParkingPlaceDetailPage> {
  bool _isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigaionBarMethod(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: white),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                width: 100.w,
                height: 285,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(parkingPlaceDetailMain),
                        fit: BoxFit.cover)),
                child: Padding(
                  padding: const EdgeInsets.only(top: 140, left: 20, right: 20),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/GetDirectionPage');
                          },
                          child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 5, color: primaryColor)
                                  ]),
                              child: Row(
                                children: [
                                  const Icon(Icons.location_on_outlined,
                                      color: white),
                                  widthSpace7,
                                  Text('See Location', style: whiteBold18),
                                ],
                              )),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5, color: primaryColor)
                                  ]),
                              child: Icon(
                                Icons.share,
                                color: white,
                                size: 2.5.h,
                              ),
                            ),
                            widthSpace10,
                            Container(
                              height: 40,
                              width: 40,
                              decoration: const BoxDecoration(
                                  color: primaryColor,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        blurRadius: 5, color: primaryColor)
                                  ]),
                              child: Icon(
                                Icons.call,
                                color: white,
                                size: 2.5.h,
                              ),
                            )
                          ],
                        )
                      ]),
                ),
              ),
              Positioned(
                  top: 255,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      decoration: const BoxDecoration(
                          color: white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          )),
                      child: Column(
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                heightSpace15,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text('Lawnfield Parks',
                                                  style: blackMedium18),
                                              heightSpace3,
                                              Text(
                                                  '3891 Ranchview Dr. Richardson, California 62639',
                                                  style: color94Regular14),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _isFavorite = !_isFavorite;
                                                  });
                                                  if (_isFavorite == true) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                primaryColor,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            content: Text(
                                                              'Added into favorite',
                                                              style:
                                                                  whiteRegular16,
                                                            )));
                                                  } else {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                            backgroundColor:
                                                                primaryColor,
                                                            duration:
                                                                const Duration(
                                                                    seconds: 1),
                                                            content: Text(
                                                              'Removed from favorite',
                                                              style:
                                                                  whiteRegular16,
                                                            )));
                                                  }
                                                },
                                                child: Icon(
                                                  _isFavorite
                                                      ? Icons.favorite_outlined
                                                      : Icons
                                                          .favorite_outline_rounded,
                                                  color: _isFavorite
                                                      ? primaryColor
                                                      : black,
                                                )),
                                          )
                                        ],
                                      ),
                                      heightSpace5,
                                      Row(
                                        children: [
                                          Text('5.0 Rating',
                                              style: color94Regular12),
                                          widthSpace10,
                                          RatingBar.builder(
                                            initialRating: 5,
                                            ignoreGestures: true,
                                            itemSize: 2.h,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 1.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: starColor,
                                              size: 1.h,
                                            ),
                                            onRatingUpdate: (rating) {},
                                          )
                                        ],
                                      ),
                                      heightSpace20,
                                      Text('Available Facilities',
                                          style: blackRegular16),
                                      heightSpace7,
                                      Row(
                                        children: facilitieList
                                            .map((e) => Container(
                                                padding: const EdgeInsets.only(
                                                    right: 15),
                                                height: 2.5.h,
                                                child: Image.asset(e)))
                                            .toList(),
                                      ),
                                      heightSpace20,
                                      Text('Parking Rate',
                                          style: blackRegular16),
                                      heightSpace7,
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 55,
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 5),
                                    itemCount: parkingRateList.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      var e = parkingRateList[index];
                                      return MyContainerWithChild(
                                        margin: index == 0
                                            ? const EdgeInsets.only(right: 5)
                                            : index ==
                                                    parkingRateList.length - 1
                                                ? const EdgeInsets.only(left: 5)
                                                : const EdgeInsets.symmetric(
                                                    horizontal: 5),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4, horizontal: 20),
                                        child: Column(children: [
                                          Text(e['title'],
                                              style: blackMedium16),
                                          Text(e['subtitle'],
                                              style: color94Regular14)
                                        ]),
                                      );
                                    },
                                  ),
                                )
                                /* Row(
                                  children: parkingRateList
                                      .map((e) => MyContainerWithChild(
                                            margin: parkingRateList.indexOf(e) == 0
                                                ? EdgeInsets.only(left: 20, right: 5)
                                                : parkingRateList.indexOf(e) == 3
                                                    ? EdgeInsets.only(left: 5)
                                                    : EdgeInsets.symmetric(
                                                        horizontal: 5),
                                            padding: EdgeInsets.symmetric(
                                                vertical: 4, horizontal: 20),
                                            child: Column(children: [
                                              Text(e['title'], style: blackMedium16),
                                              Text(e['subtitle'],
                                                  style: color94Regular14)
                                            ]),
                                          ))
                                      .toList(),
                                ), */
                                ,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      heightSpace20,
                                      Text('Payment Accepted',
                                          style: blackRegular16),
                                      heightSpace7,
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: paymentTypeList
                                              .map((e) => Expanded(
                                                    child: MyContainerWithChild(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              5),
                                                      margin: parkingRateList
                                                                  .indexOf(e) ==
                                                              0
                                                          ? const EdgeInsets
                                                              .only(right: 5)
                                                          : parkingRateList
                                                                      .indexOf(
                                                                          e) ==
                                                                  3
                                                              ? const EdgeInsets
                                                                  .only(left: 5)
                                                              : const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      5),
                                                      child: Column(
                                                        children: [
                                                          SizedBox(
                                                              height: 3.h,
                                                              child: Image.asset(
                                                                  e['image'])),
                                                          heightSpace5,
                                                          Text(e['title'],
                                                              style:
                                                                  color94Regular14)
                                                        ],
                                                      ),
                                                    ),
                                                  ))
                                              .toList()),
                                      heightSpace20,
                                      Text('Review and Rating',
                                          style: blackRegular16),
                                      heightSpace7,
                                      ...reviewRatingList.map(
                                        (e) {
                                          return Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 5),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CircleAvatar(
                                                  radius: 25,
                                                  backgroundColor: colorE6,
                                                  backgroundImage:
                                                      AssetImage(e['image']),
                                                ),
                                                widthSpace10,
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(e['user'],
                                                          style: blackMedium14),
                                                      RatingBar.builder(
                                                        initialRating: 5,
                                                        ignoreGestures: true,
                                                        itemSize: 2.h,
                                                        direction:
                                                            Axis.horizontal,
                                                        allowHalfRating: true,
                                                        itemCount: 5,
                                                        itemPadding:
                                                            const EdgeInsets
                                                                    .symmetric(
                                                                horizontal:
                                                                    1.0),
                                                        itemBuilder:
                                                            (context, _) =>
                                                                Icon(
                                                          Icons.star,
                                                          color: starColor,
                                                          size: 1.h,
                                                        ),
                                                        onRatingUpdate:
                                                            (rating) {},
                                                      ),
                                                      Text(
                                                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Justo feugiat viverra volutpat, vivamus.',
                                                        style: color94Regular14,
                                                        maxLines: 2,
                                                      ),
                                                      heightSpace5,
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          );
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                // Column(
                                //   mainAxisSize: MainAxisSize.min,
                                //   children: [
                                //     Padding(
                                //       padding: const EdgeInsets.all(20.0),
                                //       child: PrimaryButton(
                                //         text: 'Book Now',
                                //         onTap: () {

                                //         },
                                //       ),
                                //     )
                                //   ],
                                // ),
                              ]),
                        ],
                      )))
            ],
          ),
        ),
      ),
    );
  }

  Widget bottomNavigaionBarMethod() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: PrimaryButton(
            text: 'Book Now',
            onTap: () {
              Navigator.pushNamed(context, '/BookSlotPage');
            },
          ),
        )
      ],
    );
  }
}
