import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/constant.dart';

class ExtendTimeSuccessfulPage extends StatelessWidget {
  const ExtendTimeSuccessfulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 10.h, child: Image.asset(paymentSuccess)),
            heightSpace10,
            Text('Great!', style: blackMedium20),
            heightSpace5,
            AutoSizeText('You’ve Successfully Extend Your Parking Time.',
                maxLines: 1, style: color94Regular16),
            heightSpace40,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: PrimaryButton(
                text: 'Done',
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/BottomNavigation');
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
