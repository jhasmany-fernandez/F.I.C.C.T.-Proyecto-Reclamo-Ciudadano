import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';

import '../../utils/constant.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPassObsecured = true;
  bool _isConPassObsecured = true;
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        children: [
          // heightSpace40,
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Register', style: blackMedium20),
              heightSpace40,
              PrefixPrimaryTextField(
                prefixAsset: profile,
                hintText: 'Name',
              ),
              heightSpace20,
              PrefixPrimaryTextField(
                prefixAsset: email,
                hintText: 'Email Address',
                keyboardType: TextInputType.emailAddress,
              ),
              heightSpace20,
              PrefixPrimaryTextField(
                prefixAsset: mobile,
                hintText: 'Mobile Number',
                keyboardType: TextInputType.number,
              ),
              heightSpace20,
              PrefixPrimaryTextField(
                prefixAsset: lock,
                hintText: 'Create Password',
                obscureText: _isPassObsecured,
                onSuffixTap: () {
                  setState(() {
                    _isPassObsecured = !_isPassObsecured;
                  });
                },
                suffixIcon: Icon(
                  _isPassObsecured ? Icons.visibility : Icons.visibility_off,
                  size: 2.h,
                  color: color94,
                ),
              ),
              heightSpace20,
              PrefixPrimaryTextField(
                prefixAsset: lock,
                hintText: 'Confirm Password',
                obscureText: _isConPassObsecured,
                textInputAction: TextInputAction.done,
                onSuffixTap: () {
                  setState(() {
                    _isConPassObsecured = !_isConPassObsecured;
                  });
                },
                suffixIcon: Icon(
                  _isConPassObsecured ? Icons.visibility : Icons.visibility_off,
                  size: 2.h,
                  color: color94,
                ),
              ),
              heightSpace40,
              PrimaryButton(
                margin: const EdgeInsets.symmetric(horizontal: 45),
                text: 'Register',
                onTap: () {
                  Navigator.pushNamed(context, '/VerificationPage');
                },
              ),
              heightSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Already have account? ', style: color94Regular16),
                  GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text('Login Now', style: primaryMedium16)),
                ],
              ),
              heightSpace20,
            ],
          ),
        ],
      ),
    );
  }
}
