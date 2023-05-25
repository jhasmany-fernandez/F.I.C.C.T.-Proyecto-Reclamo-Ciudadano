import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constant.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

List tabs = ['Ongoing', 'History'];
List onGoingHistoryList = [
  {
    'image': historyBooking1,
    'rate': '5',
    'name': 'BDA Complex',
    'address': '4140 Parker Rd. Allentown, New Mexico 31134'
  },
  {
    'image': historyBooking2,
    'rate': '4',
    'name': 'Teacher’s Colony',
    'address': '2715 Ash Dr. San Jose, South Dakota 83475'
  },
  {
    'image': historyBooking3,
    'rate': '4',
    'name': 'Jaggasandra',
    'address': '2972 Westheimer Rd. Santa Ana,Illinois 85486'
  },
];

class _BookingPageState extends State<BookingPage> {
  Set active = {};
  final CustomTimerController _timerController = CustomTimerController();
  final _pageController = PageController();
  int _selectedTab = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _timerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        shadowColor: colorForShadow,
        elevation: 2,
        centerTitle: false,
        title: Text('Booking', style: blackMedium20),
      ),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: 75.h,
            child: Column(
              children: [
                heightSpace20,
                Container(
                  padding: const EdgeInsets.all(3),
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: colorE6),
                  child: Row(
                    children: [
                      ...tabs.map((e) {
                        var index = tabs.indexOf(e);
                        return Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedTab = index;
                            });
                            _pageController.animateToPage(_selectedTab,
                                duration: const Duration(milliseconds: 1000),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: AnimatedContainer(
                            curve: Curves.fastLinearToSlowEaseIn,
                            duration: const Duration(milliseconds: 1000),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: index == _selectedTab ? white : colorE6),
                            padding: const EdgeInsets.symmetric(vertical: 8.5),
                            alignment: Alignment.center,
                            child: Text(
                              e,
                              style: blackRegular16,
                            ),
                          ),
                        ));
                      })
                    ],
                  ),
                ),
                heightSpace10,
                Expanded(
                  child: PageView(
                    controller: _pageController,
                    onPageChanged: (value) {
                      setState(() {
                        _selectedTab = value;
                      });
                    },
                    children: [onGoingTab(), historyTab(context)],
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Widget historyTab(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: onGoingHistoryList.length,
      itemBuilder: (BuildContext context, int index) {
        var item = onGoingHistoryList[index];
        return MyContainerWithChild(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          child: Column(
            children: [
              Row(
                children: [
                  Stack(
                    children: [
                      MyContainerWithImage(
                          height: 115,
                          width: 115,
                          backgroundImage: item['image']),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.5, vertical: 6),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomRight: Radius.circular(5),
                            ),
                            color: primaryColor),
                        child: Text('\$${item['rate']}/hr', style: whiteBold12),
                      )
                    ],
                  ),
                  widthSpace10,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item['name'], style: blackRegular16),
                            GestureDetector(
                              onTap: () {
                                setState(() {});
                                active.contains(index)
                                    ? active.remove(index)
                                    : active.add(index);
                                if (active.contains(index)) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: primaryColor,
                                          duration: const Duration(seconds: 1),
                                          content: Text(
                                            'Added into favourite',
                                            style: whiteRegular16,
                                          )));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: primaryColor,
                                          duration: const Duration(seconds: 1),
                                          content: Text(
                                            'Removed from favourite',
                                            style: whiteRegular16,
                                          )));
                                }
                              },
                              child: Icon(
                                active.contains(index)
                                    ? Icons.favorite_rounded
                                    : Icons.favorite_border_rounded,
                                color: active.contains(index)
                                    ? primaryColor
                                    : black,
                                size: 2.5.h,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          width: 47.w,
                          child: Text(item['address'],
                              maxLines: 2, style: color94Regular14),
                        ),
                        heightSpace6,
                        RatingBar.builder(
                          initialRating: 5,
                          ignoreGestures: true,
                          itemSize: 1.7.h,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: starColor,
                            size: 1.h,
                          ),
                          onRatingUpdate: (rating) {},
                        ),
                        heightSpace6,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/BookSlotPage');
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 18.5),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: primaryColor),
                            child: Text('Book Now', style: whiteBold16),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  Column onGoingTab() {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(10, 8, 5, 0),
          margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
          decoration: BoxDecoration(
            color: white,
            boxShadow: [myBoxShadow],
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.location_on_outlined),
                      widthSpace3,
                      Text('Lawnfield Parks', style: blackRegular16),
                    ],
                  ),
                  heightSpace15,
                  Text('Time remaining', style: color94Regular14),
                  CustomTimer(
                      controller: _timerController,
                      begin: const Duration(minutes: 17, seconds: 10),
                      end: const Duration(),
                      builder: (time) {
                        return Text(
                            "${time.hours}:${time.minutes}:${time.seconds} min",
                            style: blackMedium20);
                      })
                ],
              ),
              SizedBox(height: 91, child: Image.asset(ongoingBooking))
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/ExtendTimePage');
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 8),
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            decoration: const BoxDecoration(
              color: primaryColor,
              boxShadow: [BoxShadow(color: primaryColor, blurRadius: 4)],
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5)),
            ),
            child: Text('Add Time', style: whiteBold16),
          ),
        ),
      ],
    );
  }
}
