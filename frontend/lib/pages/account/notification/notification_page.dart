import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/widgets.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

List notificationList = [
  {
    'title': 'Lawnfield Parks',
    'subtitle':
        'You successfully booked your parking slot.Your slot number is: B2: #B201',
  },
  {
    'title': 'Money Added',
    'subtitle':
        '\$25.00 successfully added to your wallet.Updated Wallet balance is: \$199.25',
  },
];

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Notifications',
          )),
      body: notificationList.isEmpty ? emptyData() : filledData(context),
    );
  }

  SafeArea emptyData() {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 4.5.h, child: Image.asset(emptyNotification)),
            heightSpace5,
            Text('No new notifications', style: color94Regular16)
          ],
        ),
      ),
    );
  }

  Widget filledData(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          heightSpace10,
          ...notificationList.map((e) {
            var index = notificationList.indexOf(e);
            return Dismissible(
              key: Key('$e'),
              background: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(color: red),
              ),
              onDismissed: (direction) {
                setState(() {
                  notificationList.removeAt(index);
                });
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: primaryColor,
                    duration: const Duration(seconds: 1),
                    content: Text(
                      "${e['title']} dismissed",
                      style: whiteRegular16,
                    )));
              },
              child: MyContainerWithChild(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 11),
                margin:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 42,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          boxShadow: [myBoxShadow],
                          border: Border.all(color: white, width: 2)),
                      child: const Icon(
                        Icons.notifications_outlined,
                        color: white,
                      ),
                    ),
                    widthSpace10,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e['title'], style: blackMedium16),
                        heightSpace5,
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            e['subtitle'],
                            style: color94Regular14,
                            maxLines: 2,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
