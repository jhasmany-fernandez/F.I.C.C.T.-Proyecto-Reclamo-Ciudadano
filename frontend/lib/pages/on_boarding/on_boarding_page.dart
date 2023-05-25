import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

List pagesList = [
  {'image': onBoard1, 'title': 'No More Waiting for Parking Tickets'},
  {'image': onBoard2, 'title': 'Explore Nearby Parking and Pay Online'},
  {'image': onBoard3, 'title': 'Legal Parking Spots'},
];

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.light),
      child: Scaffold(
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                      onTap: () {
                        if (_pageIndex != 2) {
                          _pageController.animateToPage(pagesList.length - 1,
                              duration: const Duration(milliseconds: 2000),
                              curve: Curves.fastLinearToSlowEaseIn);
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          // color: red,
                          width: 40,
                          child: Text(_pageIndex == 2 ? '' : 'SKIP',
                              style: whiteBold12))),
                  SmoothPageIndicator(
                    controller: _pageController, // PageController
                    count: 3,
                    effect: const ScrollingDotsEffect(
                      dotColor: white,
                      activeDotColor: white,
                      dotHeight: 7,
                      dotWidth: 7,
                      activeDotScale: 2,
                      spacing: 10,
                    ),
                  ),
                  GestureDetector(
                      onTap: () {
                        if (_pageIndex != pagesList.length - 1) {
                          _pageController.animateToPage(_pageIndex + 1,
                              duration: const Duration(milliseconds: 1500),
                              curve: Curves.fastLinearToSlowEaseIn);
                        } else {
                          Navigator.popUntil(context, (route) => route.isFirst);
                          Navigator.pushReplacementNamed(context, '/LoginPage');
                        }
                      },
                      child: Container(
                          alignment: Alignment.center,
                          // color: red,
                          width: 40,
                          child: Text(_pageIndex == 2 ? 'LOGIN' : 'NEXT',
                              style: whiteBold12))),
                ],
              ),
            )
          ],
        ),
        backgroundColor: primaryColor,
        body: Stack(
          alignment: Alignment.center,
          children: [
            PageView.builder(
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  _pageIndex = page;
                });
              },
              itemCount: pagesList.length,
              itemBuilder: (context, index) {
                var item = pagesList[index];
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(item['image']),
                );
              },
            ),
            Positioned(
                bottom: 0,
                child: SizedBox(
                  width: 86.w,
                  child: Column(
                    children: [
                      Text(
                        pagesList[_pageIndex]['title'],
                        style: whiteBold20,
                      ),
                      heightSpace10,
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Velit urna, neque justo leo mattis neque.',
                        style: whiteRegular14,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
