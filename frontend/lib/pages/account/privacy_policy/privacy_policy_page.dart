import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';

import '../../../utils/widgets.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Privacy Policy',
          )),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Justo in ut arcu viverra justo fermentum et. Mi egestas orci in molestie maecenas at faucibus turpis et.',
                  style: color94Regular15),
              heightSpace5,
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit vitae elementum nulla quis nunc, neque. Ullamcorper dolor quis nunc mauris id ultrices tellus. Auctor quis vel morbi eros euismod in ac luctus et. Urna malesuada elit sodales auctor diam purus vel.',
                  style: color94Regular15),
              heightSpace5,
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Justo in ut arcu viverra justo fermentum et. Mi egestas orci in molestie maecenas at faucibus turpis et.',
                  style: color94Regular15),
              heightSpace5,
              Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit vitae elementum nulla quis nunc, neque. Ullamcorper dolor quis nunc mauris id ultrices tellus. Auctor quis vel morbi eros euismod in ac luctus et. Urna malesuada elit sodales auctor diam purus vel.',
                  style: color94Regular14),
              heightSpace5,
            ],
          ),
        ),
      ),
    );
  }
}
