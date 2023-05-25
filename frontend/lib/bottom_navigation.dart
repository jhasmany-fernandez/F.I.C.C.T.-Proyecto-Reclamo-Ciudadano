import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/pages/account/account_page.dart';
import 'package:rc_fl_parkingspot/pages/booking/booking_page.dart';
import 'package:rc_fl_parkingspot/pages/home/home_page.dart';

import 'package:sizer/sizer.dart';

import 'utils/constant.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  DateTime? currentBackPressTime;
  int selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const HomePage(),
    const BookingPage(),
    const AccountPage(),
  ];

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: primaryColor,
        content: Text('Press back agin to exit', style: whiteRegular16),
        duration: const Duration(seconds: 1),
      ));
      return false;
    } else {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        bool backStatus = onWillPop();
        if (backStatus) {
          exit(0);
        }
        return false;
      },
      child: Scaffold(
        bottomNavigationBar: Theme(
          data: Theme.of(context)
              .copyWith(canvasColor: white, splashColor: transparent),
          child: BottomNavigationBar(
            elevation: 20,
            items: [
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          selectedIndex == 0 ? primaryColor : colorB7,
                      child: SizedBox(
                        height: 2.h,
                        child: Image.asset(bottom1, color: white),
                      ),
                    ),
                  ),
                  label: 'Find'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          selectedIndex == 1 ? primaryColor : colorB7,
                      child: SizedBox(
                        height: 2.h,
                        child: Image.asset(bottom2, color: white),
                      ),
                    ),
                  ),
                  label: 'Booking'),
              BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor:
                          selectedIndex == 2 ? primaryColor : colorB7,
                      child: SizedBox(
                        height: 2.h,
                        child: Image.asset(bottom3, color: white),
                      ),
                    ),
                  ),
                  label: 'Account'),
            ],
            onTap: (int index) {
              setState(() => selectedIndex = index);
            },
            currentIndex: selectedIndex,
            selectedItemColor: primaryColor,
            unselectedItemColor: color94,
            showUnselectedLabels: true,
            selectedLabelStyle: primaryBold14,
            unselectedLabelStyle: colorB7Bold14,
            type: BottomNavigationBarType.fixed,
          ),
        ),
        body: _widgetOptions.elementAt(selectedIndex),
      ),
    );
  }
}
