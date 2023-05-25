import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

const Color white = Colors.white;
const Color amber = Colors.amber;
const Color grey = Colors.grey;
const Color red = Colors.red;
const Color green = Colors.green;
const Color black = Colors.black;
const Color transparent = Colors.transparent;
const Color primaryColor = Color(0xffFBC02D);
const Color starColor = Color(0xffFFAC33);
const Color colorB7 = Color(0xffB7B7B7);
const Color colorE6 = Color(0xffE6E6E6);
const Color scaffoldColor = Color(0xff121212);
const Color colorC4 = Color(0xffC4C4C4);
const Color color94 = Color(0xff949494);
Color colorForShadow = const Color(0xff000000).withOpacity(.25);
BoxShadow myBoxShadow = BoxShadow(color: colorForShadow, blurRadius: 4);
BorderRadius borderRadius5 = BorderRadius.circular(5);
BorderRadius borderRadius10 = BorderRadius.circular(10);

const SizedBox heightSpace2 = SizedBox(height: 2);
const SizedBox heightSpace3 = SizedBox(height: 3);
const SizedBox heightSpace5 = SizedBox(height: 5);
const SizedBox heightSpace6 = SizedBox(height: 6);
const SizedBox heightSpace7 = SizedBox(height: 7);
const SizedBox heightSpace8 = SizedBox(height: 8);
const SizedBox heightSpace10 = SizedBox(height: 10);
const SizedBox heightSpace15 = SizedBox(height: 15);
const SizedBox heightSpace18 = SizedBox(height: 18);
const SizedBox heightSpace20 = SizedBox(height: 20);
const SizedBox heightSpace22 = SizedBox(height: 22);
const SizedBox heightSpace25 = SizedBox(height: 25);
const SizedBox heightSpace30 = SizedBox(height: 30);
const SizedBox heightSpace35 = SizedBox(height: 35);
const SizedBox heightSpace40 = SizedBox(height: 40);
const SizedBox heightSpace45 = SizedBox(height: 45);
const SizedBox heightSpace50 = SizedBox(height: 50);
const SizedBox heightSpace55 = SizedBox(height: 55);
const SizedBox heightSpace60 = SizedBox(height: 60);
const SizedBox heightSpace70 = SizedBox(height: 70);
const SizedBox heightSpace80 = SizedBox(height: 80);
const SizedBox heightSpace100 = SizedBox(height: 100);

const SizedBox widthSpace2 = SizedBox(width: 2);
const SizedBox widthSpace3 = SizedBox(width: 3);
const SizedBox widthSpace5 = SizedBox(width: 5);
const SizedBox widthSpace7 = SizedBox(width: 7);
const SizedBox widthSpace8 = SizedBox(width: 8);
const SizedBox widthSpace10 = SizedBox(width: 10);
const SizedBox widthSpace15 = SizedBox(width: 15);
const SizedBox widthSpace20 = SizedBox(width: 20);
const SizedBox widthSpace25 = SizedBox(width: 25);
const SizedBox widthSpace30 = SizedBox(width: 30);
const SizedBox widthSpace35 = SizedBox(width: 35);
const SizedBox widthSpace40 = SizedBox(width: 40);
const SizedBox widthSpace45 = SizedBox(width: 45);
const SizedBox widthSpace50 = SizedBox(width: 50);

String logo = 'assets/images/Logo.png';

String onBoard1 = 'assets/images/on_boarding/onBoard1.png';
String onBoard2 = 'assets/images/on_boarding/onBoard2.png';
String onBoard3 = 'assets/images/on_boarding/onBoard3.png';

String pageviewStation1 = 'assets/images/stations/pageview_station1.png';
String pageviewStation2 = 'assets/images/stations/pageview_station2.png';
String pageviewStation3 = 'assets/images/stations/pageview_station3.png';
String pageviewStation4 = 'assets/images/stations/pageview_station4.png';
String parkingPlaceDetailMain =
    'assets/images/stations/parkingPlaceDetailMain.png';

String profile = 'assets/images/icons/profile.png';
String email = 'assets/images/icons/email.png';
String lock = 'assets/images/icons/lock.png';
String mobile = 'assets/images/icons/mobile.png';
String bottom1 = 'assets/images/icons/bottom1.png';
String bottom2 = 'assets/images/icons/bottom2.png';
String bottom3 = 'assets/images/icons/bottom3.png';
String youHere = 'assets/images/icons/youHere.png';
String searchYellow = 'assets/images/icons/searchYello.png';
String clock1 = 'assets/images/icons/clock1.png';
String dollar2 = 'assets/images/icons/dollar2.png';
String dollar3 = 'assets/images/icons/dollar3.png';
String dollar4 = 'assets/images/icons/dollar4.png';
String dollar5 = 'assets/images/icons/dollar5.png';
String dollar6 = 'assets/images/icons/dollar6.png';
String filter = 'assets/images/icons/filter.png';
String star = 'assets/images/icons/star.png';
String galleryIcon = 'assets/images/icons/galleryIcon.png';
String cameraIcon = 'assets/images/icons/cameraIcon.png';
String yellowCar = 'assets/images/icons/yellow-car.png';
String greyNavigation = 'assets/images/icons/grey-navigation.png';
String facilities1 = 'assets/images/icons/facilities1.png';
String facilities2 = 'assets/images/icons/facilities2.png';
String facilities3 = 'assets/images/icons/facilities3.png';
String facilities4 = 'assets/images/icons/facilities4.png';
String wallet = 'assets/images/icons/wallet.png';
String cash = 'assets/images/icons/cash.png';
String cC = 'assets/images/icons/CC.png';
String pP = 'assets/images/icons/PP.png';
String reviewer1 = 'assets/images/icons/reviewer1.png';
String reviewer2 = 'assets/images/icons/reviewer2.png';
String verticalDots = 'assets/images/icons/verticalDots.png';
String carOnRoad = 'assets/images/icons/carOnRoad.png';
String locationOnRoad = 'assets/images/icons/locationOnRoad.png';
String bookSlotCar = 'assets/images/icons/bookSlotCar.png';
String bookedSlot = 'assets/images/icons/bookedSlot.png';
String downArrow = 'assets/images/icons/downArrow.png';
String leftArrow = 'assets/images/icons/leftArrow.png';
String rightArrow = 'assets/images/icons/rightArrow.png';
String myVehicle2 = 'assets/images/icons/myVehicle2.png';
String myVehicle3 = 'assets/images/icons/myVehicle3.png';
String paymentSuccess = 'assets/images/icons/paymentSuccess.png';
String qrCode = 'assets/images/icons/qrCode.png';
String ongoingBooking = 'assets/images/icons/ongoingBooking.png';
String historyBooking1 = 'assets/images/icons/historyBooking1.png';
String historyBooking2 = 'assets/images/icons/historyBooking2.png';
String historyBooking3 = 'assets/images/icons/historyBooking3.png';
String profilePic = 'assets/images/icons/profilePic.png';
String editNote = 'assets/images/icons/editNote.png';
String upBal = 'assets/images/icons/upBal.png';
String downBal = 'assets/images/icons/downBal.png';
String emptyHistory = 'assets/images/icons/emptyHistory.png';
String emptyNotification = 'assets/images/icons/emptyNotification.png';
String emptyFavorites = 'assets/images/icons/empty_favorites.png';
String shareMain = 'assets/images/icons/shareMain.png';

TextStyle color94Bold16 =
    TextStyle(fontSize: 11.2.sp, color: color94, fontFamily: 'B');
TextStyle whiteBold16 =
    TextStyle(fontSize: 11.2.sp, color: white, fontFamily: 'B');
TextStyle blackBold16 =
    TextStyle(fontSize: 11.2.sp, color: black, fontFamily: 'B');
TextStyle whiteSemiBold20 =
    TextStyle(fontSize: 14.sp, color: white, fontFamily: 'SB');
TextStyle whiteBold20 =
    TextStyle(fontSize: 14.sp, color: white, fontFamily: 'B');
TextStyle whiteMedium20 =
    TextStyle(fontSize: 14.sp, color: white, fontFamily: 'M');
TextStyle primaryMedium20 =
    TextStyle(fontSize: 14.sp, color: primaryColor, fontFamily: 'M');
TextStyle blackMedium20 =
    TextStyle(fontSize: 14.sp, color: black, fontFamily: 'M');
TextStyle whiteMedium16 =
    TextStyle(fontSize: 11.2.sp, color: white, fontFamily: 'M');
TextStyle whiteMedium14 =
    TextStyle(fontSize: 9.7.sp, color: white, fontFamily: 'M');
TextStyle primaryBold14 =
    TextStyle(fontSize: 9.7.sp, color: primaryColor, fontFamily: 'B');
TextStyle colorB7Bold14 =
    TextStyle(fontSize: 9.7.sp, color: colorB7, fontFamily: 'B');
TextStyle whiteMedium18 =
    TextStyle(fontSize: 12.6.sp, color: white, fontFamily: 'M');
TextStyle primaryMedium18 =
    TextStyle(fontSize: 12.6.sp, color: primaryColor, fontFamily: 'M');
TextStyle whiteSemiBold18 =
    TextStyle(fontSize: 12.6.sp, color: white, fontFamily: 'SB');
TextStyle color94Medium18 =
    TextStyle(fontSize: 12.6.sp, color: color94, fontFamily: 'M');
TextStyle whiteRegular18 =
    TextStyle(fontSize: 12.6.sp, color: white, fontFamily: 'R');
TextStyle blackRegular18 =
    TextStyle(fontSize: 12.6.sp, color: black, fontFamily: 'R');
TextStyle color94Regular18 =
    TextStyle(fontSize: 12.6.sp, color: color94, fontFamily: 'R');
TextStyle blackMedium18 =
    TextStyle(fontSize: 12.6.sp, color: black, fontFamily: 'M');
TextStyle blackMedium16 =
    TextStyle(fontSize: 11.2.sp, color: black, fontFamily: 'M');
TextStyle blackMedium14 =
    TextStyle(fontSize: 9.7.sp, color: black, fontFamily: 'M');
TextStyle whiteRegular15 =
    TextStyle(fontSize: 10.8.sp, color: white, fontFamily: 'R');
TextStyle whiteRegular14 =
    TextStyle(fontSize: 9.7.sp, color: white, fontFamily: 'R');
TextStyle whiteRegular12 =
    TextStyle(fontSize: 9.2.sp, color: white, fontFamily: 'R');
TextStyle whiteBold12 =
    TextStyle(fontSize: 9.2.sp, color: white, fontFamily: 'B');
TextStyle color94Regular12 =
    TextStyle(fontSize: 9.2.sp, color: color94, fontFamily: 'R');
TextStyle redRegular12 = TextStyle(
    fontSize: 9.2.sp, color: const Color(0xffFF0000), fontFamily: 'R');
TextStyle color94Medium12 =
    TextStyle(fontSize: 9.2.sp, color: color94, fontFamily: 'M');
TextStyle whiteMedium12 =
    TextStyle(fontSize: 9.2.sp, color: white, fontFamily: 'M');
TextStyle primaryMedium12 =
    TextStyle(fontSize: 9.2.sp, color: primaryColor, fontFamily: 'M');
TextStyle whiteRegular16 =
    TextStyle(fontSize: 11.2.sp, color: white, fontFamily: 'R');
TextStyle primaryRegular16 =
    TextStyle(fontSize: 11.2.sp, color: primaryColor, fontFamily: 'R');
TextStyle primaryMedium16 =
    TextStyle(fontSize: 11.2.sp, color: primaryColor, fontFamily: 'M');
TextStyle primarySemiBold18 =
    TextStyle(fontSize: 12.6.sp, color: primaryColor, fontFamily: 'SB');
TextStyle primarySemiBold16 =
    TextStyle(fontSize: 11.2.sp, color: primaryColor, fontFamily: 'SB');
TextStyle color94Regular15 =
    TextStyle(fontSize: 10.8.sp, color: color94, fontFamily: 'R');
TextStyle color94Regular14 =
    TextStyle(fontSize: 9.7.sp, color: color94, fontFamily: 'R');
TextStyle primaryRegular14 =
    TextStyle(fontSize: 9.7.sp, color: primaryColor, fontFamily: 'R');
TextStyle blackRegular14 =
    TextStyle(fontSize: 9.7.sp, color: black, fontFamily: 'R');
TextStyle primaryMedium15 =
    TextStyle(fontSize: 10.8.sp, color: primaryColor, fontFamily: 'M');
TextStyle color94Regular16 =
    TextStyle(fontSize: 11.2.sp, color: color94, fontFamily: 'R');
TextStyle blackRegular16 =
    TextStyle(fontSize: 11.2.sp, color: black, fontFamily: 'R');
TextStyle redRegular16 = TextStyle(
    fontSize: 11.2.sp, color: const Color(0xffFF0000), fontFamily: 'R');
TextStyle greenRegular16 = TextStyle(
    fontSize: 11.2.sp, color: const Color(0xff008F11), fontFamily: 'R');
TextStyle whiteBold18 =
    TextStyle(fontSize: 12.6.sp, color: white, fontFamily: 'B');
TextStyle primaryBold18 =
    TextStyle(fontSize: 12.6.sp, color: primaryColor, fontFamily: 'B');
TextStyle whiteBold22 =
    TextStyle(fontSize: 15.5.sp, color: white, fontFamily: 'B');
TextStyle whiteMedium22 =
    TextStyle(fontSize: 15.5.sp, color: white, fontFamily: 'M');
