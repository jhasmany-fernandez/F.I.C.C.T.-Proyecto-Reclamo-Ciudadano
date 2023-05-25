import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rc_fl_parkingspot/pages/account/edit_profile/edit_profile_page.dart';
import 'package:rc_fl_parkingspot/pages/account/favorites/favorites_page.dart';
import 'package:rc_fl_parkingspot/pages/account/invite_friends/invite_friends_page.dart';
import 'package:rc_fl_parkingspot/pages/account/notification/notification_page.dart';
import 'package:rc_fl_parkingspot/pages/account/privacy_policy/privacy_policy_page.dart';
import 'package:rc_fl_parkingspot/pages/account/support/support_page.dart';
import 'package:rc_fl_parkingspot/pages/account/wallet/wallet_page.dart';
import 'package:rc_fl_parkingspot/pages/auth/login_page.dart';
import 'package:rc_fl_parkingspot/pages/auth/register_page.dart';
import 'package:rc_fl_parkingspot/pages/auth/verification_page.dart';
import 'package:rc_fl_parkingspot/pages/booking/extend_time/extend_time_page.dart';
import 'package:rc_fl_parkingspot/pages/booking/extend_time_successful/extend_time_successful_page.dart';
import 'package:rc_fl_parkingspot/pages/home/add_new_vehicle/add_new_vehicle_page.dart';
import 'package:rc_fl_parkingspot/pages/home/book_slot/book_slot_page.dart';
import 'package:rc_fl_parkingspot/pages/home/booking_successful/booking_successful_page.dart';
import 'package:rc_fl_parkingspot/pages/home/filter_result/filter_result_page.dart';
import 'package:rc_fl_parkingspot/pages/home/get_direction/get_direction_page.dart';
import 'package:rc_fl_parkingspot/pages/home/my_vehicle/my_vehicle_page.dart';
import 'package:rc_fl_parkingspot/pages/home/parking_place_detail/parking_place_detail_page.dart';
import 'package:rc_fl_parkingspot/pages/home/search/search_page.dart';
import 'package:rc_fl_parkingspot/pages/home/search_result/search_result_page.dart';
import 'package:rc_fl_parkingspot/pages/on_boarding/on_boarding_page.dart';
import 'package:rc_fl_parkingspot/splash_page.dart';
import 'package:rc_fl_parkingspot/utils/constant.dart';
import 'package:sizer/sizer.dart';

import 'bottom_navigation.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return AnnotatedRegion(
          value: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'ParkingSpot',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                appBarTheme:
                    const AppBarTheme(iconTheme: IconThemeData(color: black)),
                scaffoldBackgroundColor: const Color(0xffFFFFFF)),
            initialRoute: '/SplashPage',
            // initialRoute: '/BottomNavigation',
            onGenerateRoute: (route) {
              switch (route.name) {
                case '/SplashPage':
                  return PageTransition(
                      isIos: true,
                      child: const SplashPage(),
                      type: PageTransitionType.rightToLeft);
                case '/OnBoardingPage':
                  return PageTransition(
                      isIos: true,
                      child: const OnBoardingPage(),
                      type: PageTransitionType.rightToLeft);
                case '/LoginPage':
                  return PageTransition(
                      isIos: true,
                      child: const LoginPage(),
                      type: PageTransitionType.rightToLeft);
                case '/RegisterPage':
                  return PageTransition(
                      isIos: true,
                      child: const RegisterPage(),
                      type: PageTransitionType.rightToLeft);
                case '/VerificationPage':
                  return PageTransition(
                      isIos: true,
                      child: const VerificationPage(),
                      type: PageTransitionType.rightToLeft);
//*BottomNavigation
                case '/BottomNavigation':
                  return PageTransition(
                      isIos: true,
                      child: const BottomNavigation(),
                      type: PageTransitionType.rightToLeft);
                case '/SearchPage':
                  return PageTransition(
                      isIos: true,
                      child: const SearchPage(),
                      type: PageTransitionType.rightToLeft);
                case '/SearchResultPage':
                  return PageTransition(
                      isIos: true,
                      child: const SearchResultPage(),
                      type: PageTransitionType.rightToLeft);
                case '/FilterResultPage':
                  return PageTransition(
                      isIos: true,
                      child: const FilterResultPage(),
                      type: PageTransitionType.rightToLeft);
                case '/ParkingPlaceDetailPage':
                  return PageTransition(
                      isIos: true,
                      child: const ParkingPlaceDetailPage(),
                      type: PageTransitionType.rightToLeft);
                case '/GetDirectionPage':
                  return PageTransition(
                      isIos: true,
                      child: const GetDirectionPage(),
                      type: PageTransitionType.rightToLeft);
                case '/BookSlotPage':
                  return PageTransition(
                      isIos: true,
                      child: const BookSlotPage(),
                      type: PageTransitionType.rightToLeft);
                case '/BookingSuccessfulPage':
                  return PageTransition(
                      isIos: true,
                      child: const BookingSuccessfulPage(),
                      type: PageTransitionType.rightToLeft);
                case '/MyVehiclePage':
                  return PageTransition(
                      isIos: true,
                      child: const MyVehiclePage(),
                      type: PageTransitionType.rightToLeft);
                case '/AddNewVehiclePage':
                  return PageTransition(
                      isIos: true,
                      child: const AddNewVehiclePage(),
                      type: PageTransitionType.rightToLeft);
                case '/ExtendTimePage':
                  return PageTransition(
                      isIos: true,
                      child: const ExtendTimePage(),
                      type: PageTransitionType.rightToLeft);
                case '/ExtendTimeSuccessfulPage':
                  return PageTransition(
                      isIos: true,
                      child: const ExtendTimeSuccessfulPage(),
                      type: PageTransitionType.rightToLeft);
                case '/EditProfilePage':
                  return PageTransition(
                      isIos: true,
                      child: const EditProfilePage(),
                      type: PageTransitionType.rightToLeft);
                case '/WalletPage':
                  return PageTransition(
                      isIos: true,
                      child: const WalletPage(),
                      type: PageTransitionType.rightToLeft);
                case '/NotificationPage':
                  return PageTransition(
                      isIos: true,
                      child: const NotificationPage(),
                      type: PageTransitionType.rightToLeft);
                case '/FavoritesPage':
                  return PageTransition(
                      isIos: true,
                      child: const FavoritesPage(),
                      type: PageTransitionType.rightToLeft);
                case '/InviteFriendsPage':
                  return PageTransition(
                      isIos: true,
                      child: const InviteFriendsPage(),
                      type: PageTransitionType.rightToLeft);
                case '/SupportPage':
                  return PageTransition(
                      isIos: true,
                      child: const SupportPage(),
                      type: PageTransitionType.rightToLeft);
                case '/PrivacyPolicyPage':
                  return PageTransition(
                      isIos: true,
                      child: const PrivacyPolicyPage(),
                      type: PageTransitionType.rightToLeft);
              }
              return null;
            },
          ),
        );
      },
    );
  }
}
