import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:rc_fl_parkingspot/utils/widgets.dart';
import 'package:sizer/sizer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isPassObsecured = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          physics: const BouncingScrollPhysics(),
          children: [
            heightSpace55,
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Login', style: blackMedium20),
                heightSpace40,
                PrefixPrimaryTextField(
                  prefixAsset: profile,
                  hintText: 'Name',
                ),
                heightSpace20,
                PrefixPrimaryTextField(
                  prefixAsset: lock,
                  hintText: 'Password',
                  obscureText: _isPassObsecured,
                  textInputAction: TextInputAction.done,
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
                heightSpace10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forget password?', style: color94Medium12),
                  ],
                ),
                heightSpace40,
                PrimaryButton(
                  margin: const EdgeInsets.symmetric(horizontal: 45),
                  text: 'Login',
                  onTap: () {
                    Navigator.pushNamed(context, '/RegisterPage');
                  },
                ),
                heightSpace20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don’t have account? ', style: color94Regular16),
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/RegisterPage');
                        },
                        child: Text('Register Now', style: primaryMedium16)),
                  ],
                ),
                heightSpace20,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
