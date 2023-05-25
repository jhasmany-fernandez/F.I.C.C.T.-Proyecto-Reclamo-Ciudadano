import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../helper/ui_helper.dart';
import '../../utils/constant.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

final defaultPinTheme = PinTheme(
  width: 5.5.h,
  height: 5.5.h,
  textStyle:
      const TextStyle(fontSize: 22, color: primaryColor, fontFamily: 'M'),
  decoration: BoxDecoration(
    // border: Border.all(color: primaryColor, width: 1.0),
    color: Colors.white,
    borderRadius: BorderRadius.circular(5),
    boxShadow: [
      BoxShadow(
        color: colorForShadow,
        blurRadius: 4.0,
        offset: const Offset(0.0, 0.0),
      ),
    ],
  ),
  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: primaryColor),
  borderRadius: BorderRadius.circular(5),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: white,
    border: Border.all(color: primaryColor, width: 1.0),
  ),
);

class _VerificationPageState extends State<VerificationPage> {
  final TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(56),
        child: MyAppBar(
          elevation: 0,
          backgroundColor: transparent,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: ListView(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
            // heightSpace10,
            Text(
              'Verification',
              style: blackMedium20,
              textAlign: TextAlign.center,
            ),
            heightSpace15,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Text(
                'We’ll send you a One Time Password on\nregister mobile number',
                style: color94Regular16,
                textAlign: TextAlign.center,
              ),
            ),
            heightSpace30,
            Pinput(
                controller: pinController,
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: focusedPinTheme,
                submittedPinTheme: submittedPinTheme,
                // validator: (s) {
                //   return s == '2222' ? null : translation(context).pinIncorrect;
                // },
                pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                showCursor: true,
                onCompleted: (pin) {
                  UiHelper.showLoadingDialog(context, 'Please wait...');
                  Timer(const Duration(seconds: 3), () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(
                        context, '/BottomNavigation');
                  });
                }),
            heightSpace20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don’t rerceive code? ', style: color94Regular16),
                Text('Resend', style: primaryMedium16),
              ],
            ),
            heightSpace40,
            PrimaryButton(
              margin: const EdgeInsets.symmetric(horizontal: 45),
              text: 'Continue',
              onTap: () {
                UiHelper.showLoadingDialog(context, 'Please wait...');
                Timer(const Duration(seconds: 3), () {
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacementNamed(context, '/BottomNavigation');
                });
              },
            ),
            heightSpace20,
          ],
        ),
      ),
    );
  }
}
