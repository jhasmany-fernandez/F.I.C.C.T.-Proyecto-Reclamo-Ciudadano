import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constant.dart';

class InviteFriendsPage extends StatelessWidget {
  const InviteFriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      bottomNavigationBar: bottomNavigationBar(context),
      appBar: appBarMethod(),
      body: bodyMethod(),
    );
  }

  Column bottomNavigationBar(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            alignment: Alignment.center,
            width: 60.w,
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text('Invite Now', style: primaryBold18),
          ),
        )
      ],
    );
  }

  Widget bodyMethod() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(shareMain),
            Text(
              'Earn \$5.00 for every referral who completes\naccount opening successfully.',
              style: whiteRegular16,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }

  AppBar appBarMethod() {
    return AppBar(
        automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(
          color: white, //change your color here
        ),
        backgroundColor: primaryColor,
        systemOverlayStyle: const SystemUiOverlayStyle(
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.light, // For Android (dark icons)
          statusBarBrightness: Brightness.dark, // For iOS (dark icons)
          statusBarColor: transparent,
        ),
        elevation: 0,
        // shadowColor: colorForShadow,
        centerTitle: false,
        title: Align(
          alignment: const Alignment(-1.2, 0),
          child: AutoSizeText(
            'Invite Friends',
            style: whiteMedium20,
            maxLines: 1,
          ),
        ));
  }
}
