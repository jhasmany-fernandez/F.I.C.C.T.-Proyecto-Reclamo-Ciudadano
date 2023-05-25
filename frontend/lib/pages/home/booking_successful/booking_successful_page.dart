import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/widgets.dart';

class BookingSuccessfulPage extends StatelessWidget {
  const BookingSuccessfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List detailList = [
      {'title': 'Vehicle:', 'subtitle': 'Toyota Metrix'},
      {'title': 'Vehicle Number:', 'subtitle': 'GJ05NC1710'},
      {'title': 'Selected Slot:', 'subtitle': 'B2: #B201'},
    ];
    List unicodes = List.generate(11, (index) => index, growable: true);
    return Scaffold(
      // appBar:
      //     PreferredSize(preferredSize: Size.fromHeight(56), child: MyAppBar()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Column(
                children: [
                  heightSpace20,
                  SizedBox(height: 10.h, child: Image.asset(paymentSuccess)),
                  heightSpace10,
                  Text('Great!', style: blackMedium20),
                  heightSpace5,
                  AutoSizeText('You’ve Successfully Booked Parking Slot.',
                      maxLines: 1, style: color94Regular16),
                  heightSpace20,
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Booking Details', style: blackMedium18),
                  heightSpace20,
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Ticket Number:', style: color94Regular14),
                            heightSpace3,
                            AutoSizeText.rich(TextSpan(
                                text: 'BOGY1710 ',
                                style: blackMedium16,
                                children: [
                                  TextSpan(
                                      text:
                                          '(scan ticket when you reach parking lot)',
                                      style: redRegular12)
                                ])),
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 60, width: 60, child: Image.asset(qrCode))
                    ],
                  ),
                  heightSpace10,
                  ...detailList.map((e) => Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e['title'], style: color94Regular14),
                            heightSpace3,
                            Text(e['subtitle'], style: blackMedium14),
                          ],
                        ),
                      )),
                  Text('Parking Spot:', style: color94Regular14),
                  heightSpace3,
                  AutoSizeText.rich(TextSpan(
                      text: 'Lawnfield Parks ',
                      style: blackMedium14,
                      children: [
                        TextSpan(
                            text: '(3891 Ranchview Dr. Richardson, California',
                            style: color94Regular14)
                      ])),
                  heightSpace20,
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Enter After', style: color94Regular14),
                            heightSpace3,
                            Text('12:30 pm', style: blackMedium14),
                            heightSpace3,
                            Text('Mon, Oct 17', style: color94Regular12),
                          ],
                        ),
                      ),
                      ...unicodes.map((e) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 3),
                            child: Text('\u2022', style: color94Regular18),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Exit Before', style: color94Regular14),
                            heightSpace3,
                            Text('1:30pm', style: blackMedium14),
                            heightSpace3,
                            Text('Mon, Oct 17', style: color94Regular12),
                          ],
                        ),
                      ),
                    ],
                  ),
                  heightSpace30,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: PrimaryButton(
                      text: 'Get Direction',
                      onTap: () {
                        Navigator.pushNamed(context, '/GetDirectionPage');
                      },
                    ),
                  ),
                  heightSpace20,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: PrimaryButton(
                      backgroundColor: white,
                      shadowColor: colorForShadow,
                      style: primaryBold18,
                      text: 'Not Now',
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, '/BottomNavigation');
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
