import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:sizer/sizer.dart';

import '../../../utils/widgets.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController _nameController =
      TextEditingController(text: 'Samantha Smith');
  final TextEditingController _emailController =
      TextEditingController(text: 'smithsamantha@gmail.com');
  final TextEditingController _numberController =
      TextEditingController(text: '+91 1236547890');
  final TextEditingController _passwordController =
      TextEditingController(text: '1234567890');

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _numberController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
          preferredSize: Size.fromHeight(56),
          child: MyAppBar(
            title: 'Edit Profile',
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightSpace20,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 115,
                    child: Stack(
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            openSheet(context);
                          },
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: colorE6,
                            backgroundImage: AssetImage(profilePic),
                          ),
                        ),
                        Positioned(
                          bottom: -6,
                          left: 6,
                          child: CupertinoButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              openSheet(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 11, vertical: 3),
                              decoration: BoxDecoration(
                                  color: primaryColor,
                                  border: Border.all(color: white),
                                  boxShadow: const [
                                    BoxShadow(
                                        blurRadius: 5, color: primaryColor)
                                  ],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(children: [
                                Icon(Icons.camera_alt_outlined,
                                    color: white, size: 2.h),
                                widthSpace5,
                                Text('Change', style: whiteMedium12),
                              ]),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              heightSpace20,
              Text('Name', style: color94Regular14),
              heightSpace7,
              MyContainerWithChild(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _nameController,
                  style: blackMedium14,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Name',
                      hintStyle: color94Regular15),
                ),
              ),
              heightSpace18,
              Text('Email Address', style: color94Regular14),
              heightSpace7,
              MyContainerWithChild(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _emailController,
                  style: blackMedium14,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Email Address',
                      hintStyle: color94Regular15),
                ),
              ),
              heightSpace18,
              Text('Mobile Number', style: color94Regular14),
              heightSpace7,
              MyContainerWithChild(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _numberController,
                  style: blackMedium14,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Mobile Number',
                      hintStyle: color94Regular15),
                ),
              ),
              heightSpace18,
              Text('Password', style: color94Regular14),
              heightSpace7,
              MyContainerWithChild(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextField(
                  controller: _passwordController,
                  style: blackMedium14,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      hintStyle: color94Regular15),
                ),
              ),
              heightSpace40,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: PrimaryButton(
                  text: 'Update Profile',
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void openSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              heightSpace10,
              const Center(
                  child: SizedBox(
                      width: 120,
                      child: Divider(color: primaryColor, thickness: 2))),
              heightSpace5,
              Center(child: Text('Choose Option', style: blackMedium18)),
              heightSpace10,
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: SizedBox(
                    height: 20,
                    child: Row(
                      children: [
                        Image.asset(cameraIcon, height: 22),
                        widthSpace10,
                        Text('Take a picture', style: blackBold16),
                      ],
                    ),
                  )),
              heightSpace5,
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SizedBox(
                  height: 20,
                  child: Row(
                    children: [
                      Image.asset(galleryIcon, height: 22),
                      widthSpace10,
                      Text('Select from gallery', style: blackBold16),
                    ],
                  ),
                ),
              ),
              heightSpace20
            ],
          ),
        );
      },
    );
  }
}
