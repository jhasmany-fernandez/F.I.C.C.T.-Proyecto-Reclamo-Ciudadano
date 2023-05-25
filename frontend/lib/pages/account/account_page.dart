import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/helper/ui_helper.dart';

import '../../utils/constant.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFAFAFA),
        shadowColor: colorForShadow,
        elevation: 2,
        centerTitle: false,
        title: Text('Account', style: blackMedium20),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              heightSpace20,
              profileDetailRow(context),
              heightSpace10,
              ...tapableItems(context)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> tapableItems(BuildContext context) {
    List accountItems = [
      {'title': 'Wallet', 'navigate': '/WalletPage'},
      {'title': 'My Vehicles', 'navigate': '/MyVehiclePage'},
      {'title': 'Notifications', 'navigate': '/NotificationPage'},
      {'title': 'Favorites', 'navigate': '/FavoritesPage'},
      {'title': 'Invite Friends', 'navigate': '/InviteFriendsPage'},
      {'title': 'Support', 'navigate': '/SupportPage'},
      {'title': 'Privacy Policy', 'navigate': '/PrivacyPolicyPage'},
      {'title': 'Logout', 'navigate': '/'},
    ];
    return [
      ...accountItems.map((e) {
        var index = accountItems.indexOf(e);
        return GestureDetector(
          onTap: index == accountItems.length - 1
              ? () {
                  UiHelper.showLogOutDialog(context);
                }
              : () {
                  Navigator.pushNamed(context, e['navigate']);
                },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.5, vertical: 7),
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: colorE6)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(e['title'],
                    style: index == accountItems.length - 1
                        ? primaryRegular16
                        : blackRegular16),
                Icon(
                  Icons.chevron_right_outlined,
                  color:
                      index == accountItems.length - 1 ? primaryColor : black,
                )
              ],
            ),
          ),
        );
      })
    ];
  }

  Row profileDetailRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: colorE6,
              backgroundImage: AssetImage(profilePic),
            ),
            widthSpace10,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Samantha Smith', style: blackMedium18),
                Text('+91 1236547890', style: color94Regular16),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, '/EditProfilePage');
          },
          child: Container(
            padding: const EdgeInsets.all(12),
            height: 40,
            width: 40,
            decoration: const BoxDecoration(
              color: primaryColor,
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(blurRadius: 5, color: primaryColor)],
            ),
            child: Image.asset(editNote),
          ),
        )
      ],
    );
  }
}
