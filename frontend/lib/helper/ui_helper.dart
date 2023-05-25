import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../utils/constant.dart';
import '../utils/widgets.dart';

class UiHelper {
  static void showLogOutDialog(
    BuildContext context,
  ) {
    AlertDialog logoutDialog = AlertDialog(
      insetPadding: EdgeInsets.zero,
      contentPadding: const EdgeInsets.only(top: 30, bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      content: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: 80.w,
            child: AutoSizeText(
              'Sure you want to Logout?',
              style: blackMedium18,
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          )),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: PrimaryButton(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  shadowColor: colorForShadow,
                  backgroundColor: white,
                  text: 'Cancel',
                  style: primaryBold18,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Expanded(
                child: PrimaryButton(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  text: 'Logout',
                  style: whiteBold18,
                  onTap: () {
                    Navigator.popUntil(context, (route) => route.isFirst);
                    Navigator.pushReplacementNamed(context, '/LoginPage');
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
    showDialog(context: context, builder: (context) => logoutDialog);
  }

  static void showLoadingDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        content: Container(
            width: 100.w,
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(color: primaryColor),
                heightSpace20,
                Text(
                  title,
                  style: color94Regular15,
                ),
              ],
            )),
      ),
    );
  }
}
