import 'package:flutter/material.dart';

import '../../../utils/constant.dart';
import '../../../utils/widgets.dart';

class SupportPage extends StatelessWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Support',
          )),
      body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                heightSpace15,
                MyContainerWithChild(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.symmetric(vertical: 5)
                      .copyWith(bottom: 15),
                  child: TextField(
                    style: color94Regular15,
                    cursorColor: primaryColor,
                    textInputAction: TextInputAction.next,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                      hintStyle: color94Regular14,
                    ),
                  ),
                ),
                MyContainerWithChild(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.symmetric(vertical: 5)
                      .copyWith(bottom: 15),
                  child: TextField(
                    style: color94Regular15,
                    cursorColor: primaryColor,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      hintStyle: color94Regular14,
                    ),
                  ),
                ),
                MyContainerWithChild(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: TextField(
                    style: color94Regular15,
                    cursorColor: primaryColor,
                    textInputAction: TextInputAction.done,
                    maxLines: 5,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Write Here',
                      hintStyle: color94Regular14,
                    ),
                  ),
                ),
                heightSpace30,
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: PrimaryButton(
                    text: 'Submit',
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                )
              ],
            ),
          )),
    );
  }
}
