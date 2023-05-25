import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:sizer/sizer.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarMethod(),
      body: bodyMethod(context),
    );
  }

  SingleChildScrollView bodyMethod(BuildContext context) {
    List recentlySearchedList = [
      {
        'title': 'New York',
        'subtitle': '4140 Parker Rd. Allentown, New Mexico 31134'
      },
      {
        'title': 'Jordern Park',
        'subtitle': '2972 Westheimer Rd. Santa Ana, Illinois 85486 '
      },
      {
        'title': 'Illinois',
        'subtitle': '4517 Washington Ave. Manchester, Kentucky 39495'
      },
      {
        'title': 'Lawnfield Parks',
        'subtitle': '3517 W. Gray St. Utica, Pennsylvania 57867'
      },
    ];
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              heightSpace10,
              ...recentlySearchedList.map(
                (e) => InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/SearchResultPage');
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        SizedBox(height: 2.3.h, child: Image.asset(clock1)),
                        widthSpace8,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(e['title'], style: blackRegular14),
                            heightSpace3,
                            Text(e['subtitle'], style: color94Regular12),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  PreferredSize appBarMethod() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(76),
      child: AppBar(
        toolbarHeight: 76,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: transparent,
        elevation: 0,
        titleSpacing: 0,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          margin: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: borderRadius10,
            boxShadow: [myBoxShadow],
            color: white,
          ),
          child: Row(
            children: [
              Expanded(
                  child: TextField(
                cursorColor: primaryColor,
                style: color94Regular14,
                textInputAction: TextInputAction.search,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Search location',
                    hintStyle: color94Regular14),
              )),
              SizedBox(
                height: 1.7.h,
                child: Image.asset(searchYellow),
              )
            ],
          ),
        ),
      ),
    );
  }
}
