import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import 'package:table_calendar/table_calendar.dart';

import 'constant.dart';

class PrimaryButton extends StatelessWidget {
  final double? height;
  final Color? shadowColor;
  final Color? backgroundColor;
  final TextStyle? style;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final String? text;
  const PrimaryButton({
    Key? key,
    this.text = '',
    this.onTap,
    this.margin,
    this.style,
    this.backgroundColor = primaryColor,
    this.shadowColor,
    this.height,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          alignment: Alignment.center,
          margin: margin,
          // height: height ?? 6.7.h,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 14.5),
          decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  blurRadius: 5,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                  color: shadowColor ?? const Color(0xffFFCC4D),
                ),
              ]),
          child: Text(
            text!,
            style: style ?? whiteBold18,
          )),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final double? elevation;
  final Color? backgroundColor;
  final List<Widget>? actions;
  final TextStyle? titleStyle;
  final bool? centerTitle;
  final String? title;
  const MyAppBar(
      {Key? key,
      this.title = '',
      this.centerTitle = false,
      this.titleStyle,
      this.actions,
      this.backgroundColor,
      this.elevation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      iconTheme: const IconThemeData(
        color: Colors.black, //change your color here
      ),
      backgroundColor: backgroundColor ?? const Color(0xffFAFAFA),
      systemOverlayStyle: const SystemUiOverlayStyle(
        // Status bar brightness (optional)
        statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
        statusBarBrightness: Brightness.light, // For iOS (dark icons)
        statusBarColor: transparent,
      ),
      elevation: elevation ?? 2,
      shadowColor: colorForShadow,
      centerTitle: centerTitle,
      title: centerTitle == false
          ? Align(
              alignment: Localizations.localeOf(context) == const Locale('ar')
                  ? const Alignment(1.2, 0)
                  : const Alignment(-1.2, 0),
              child: AutoSizeText(
                title.toString(),
                style: titleStyle ?? blackMedium20,
                maxLines: 1,
              ))
          : AutoSizeText(
              title.toString(),
              style: titleStyle ?? blackMedium20,
              maxLines: 1,
            ),
      actions: actions,
    );
  }
}

class MyContainerWithChild extends StatelessWidget {
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment;
  final Color? shadowColor;
  final Offset? offset;
  final double? height;
  final double? width;
  final double? blurRadius;
  final double? spreadRadius;
  final BoxBorder? border;
  final Widget? child;
  final double? borderRadius;
  final Color? color;
  final List<BoxShadow>? boxShadow;
  const MyContainerWithChild({
    Key? key,
    this.borderRadius = 10,
    this.color = white,
    this.border,
    this.child,
    this.height,
    this.width,
    this.blurRadius = 4,
    this.spreadRadius = 0,
    this.shadowColor,
    this.offset,
    this.alignment = Alignment.center,
    this.padding,
    this.margin,
    this.boxShadow,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        margin: margin,
        alignment: alignment,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius!),
            border: border,
            boxShadow: boxShadow ??
                [
                  BoxShadow(
                    color: shadowColor ?? colorForShadow,
                    blurRadius: blurRadius ?? 0,
                    spreadRadius: spreadRadius ?? 0,
                    offset: offset ?? const Offset(0, 0),
                  ),
                ]),
        child: child,
      ),
    );
  }
}

class MyContainerWithImage extends StatelessWidget {
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Alignment? alignment;
  final String backgroundImage;
  final Color? shadowColor;
  final Offset? offset;
  final double? height;
  final double? width;
  final double? blurRadius;
  final double? spreadRadius;
  final BoxBorder? border;
  final Widget? child;
  final double? borderRadius;
  final Color? color;
  final BoxFit? boxFit;
  const MyContainerWithImage({
    Key? key,
    this.borderRadius,
    this.color = white,
    this.border,
    this.child,
    this.height,
    this.width,
    this.blurRadius = 4,
    this.spreadRadius = 0,
    this.shadowColor,
    this.offset,
    required this.backgroundImage,
    this.alignment,
    this.padding,
    this.margin,
    this.boxFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        padding: padding,
        margin: margin,
        alignment: alignment,
        height: height,
        width: width,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius ?? 5),
            border: border,
            image: DecorationImage(
                fit: boxFit ?? BoxFit.cover,
                image: AssetImage(backgroundImage)),
            boxShadow: [
              BoxShadow(
                color: shadowColor ?? colorForShadow,
                blurRadius: blurRadius ?? 4,
                spreadRadius: spreadRadius ?? 0,
                offset: offset ?? const Offset(0, 0),
              ),
            ]),
        child: child,
      ),
    );
  }
}

// class PrimaryNormalText extends StatelessWidget {
//   final String? title;
//   final TextStyle? textStyle;

//   const PrimaryNormalText({
//     Key? key,
//     this.title = '',
//     this.textStyle,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return AutoSizeText(
//       title!,
//       // style: textStyle ?? primaryNormalTextsp,
//       maxLines: 1,
//     );
//   }
// }

class PrefixPrimaryTextField extends StatelessWidget {
  final VoidCallback? onSuffixTap;
  final Icon? suffixIcon;
  final bool? obscureText;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final double? height;
  final EdgeInsetsGeometry? padding;
  final TextEditingController? controller;
  final String? prefixAsset;
  final String? hintText;

  const PrefixPrimaryTextField({
    Key? key,
    this.controller,
    this.prefixAsset,
    this.hintText,
    this.padding,
    this.height,
    this.maxLines,
    this.keyboardType,
    this.textInputAction,
    this.obscureText,
    this.suffixIcon,
    this.onSuffixTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyContainerWithChild(
      // height: height ?? 6.5.h,
      blurRadius: 6,
      // margin: EdgeInsets.symmetric(vertical: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          prefixAsset != null
              ? SizedBox(height: 2.h, child: Image.asset(prefixAsset!))
              : const SizedBox(),
          widthSpace10,
          Expanded(
            child: TextField(
              controller: controller,
              style: color94Regular15,
              cursorColor: primaryColor,
              keyboardType: keyboardType,
              obscureText: obscureText ?? false,
              textInputAction: textInputAction ?? TextInputAction.next,
              maxLines: maxLines ?? 1,
              decoration: InputDecoration(
                // suffixIcon: suffixIcon,
                border: InputBorder.none,
                hintText: hintText,
                hintStyle: color94Regular15,
              ),
            ),
          ),
          suffixIcon != null
              ? SizedBox(
                  height: 2.h,
                  child: GestureDetector(onTap: onSuffixTap, child: suffixIcon))
              : const SizedBox()
        ],
      ),
    );
  }
}

class MyBottomSheet extends StatelessWidget {
  final String? title;
  final VoidCallback onTap;
  const MyBottomSheet({Key? key, this.title = '', required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: 100.w,
        height: Platform.isIOS ? 7.5.h : 7.h,
        color: primaryColor,
        child: Text(
          title!,
          // style: whiteBold13sp,
        ),
      ),
    );
  }
}

// class MyPlacePicker extends StatelessWidget {
//   static const kInitialPosition = LatLng(-33.8567844, 151.213108);
//   final void Function(PickResult)? onPlacePicked;
//   const MyPlacePicker({Key? key, this.onPlacePicked}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // bottomSheet: MyBottomSheet(
//       //   title: 'Proceed',
//       //   onTap: bottomSheetOnTap!,
//       // ),
//       body: SizedBox(
//         // height: 97.h,
//         child: PlacePicker(
//           resizeToAvoidBottomInset:
//               false, // only works on fullscreen, less flickery
//           apiKey:
//               Platform.isAndroid ? APIKeys.androidApiKey : APIKeys.iosApiKey,
//           hintText: "Search location",
//           searchingText: "Please wait ...",
//           selectText: "Select place",
//           outsideOfPickAreaText: "Place not in area",
//           initialPosition: MyPlacePicker.kInitialPosition,
//           useCurrentLocation: true,
//           selectInitialPosition: true,
//           usePinPointingSearch: true,
//           usePlaceDetailSearch: true,
//           zoomGesturesEnabled: true,
//           zoomControlsEnabled: true,
//           onMapCreated: (controller) {
//             log("Map created");
//           },
//           onPlacePicked: onPlacePicked,
//           // (PickResult result) {
//           //   log("Place picked: ${result.formattedAddress}");
//           //   setState(() {
//           //     selectedPlace = result;
//           //     pickText = selectedPlace!.formattedAddress.toString();
//           //     Navigator.of(context).pop();
//           //   });
//           // },
//           onMapTypeChanged: (mapType) {
//             log("Map type changed to ${mapType.toString()}");
//           },
//         ),
//       ),
//     );
//   }
// }

class ExpansionCalender extends StatelessWidget {
  final DateTime? focusedDay;
  final Function(bool)? onExpansionChanged;
  final bool Function(DateTime)? selectedDayPredicate;
  final Function(DateTime, DateTime)? onDaySelected;
  final CalendarFormat? calendarFormat;

  const ExpansionCalender({
    Key? key,
    this.onExpansionChanged,
    required this.calendarFormat,
    this.onDaySelected,
    this.selectedDayPredicate,
    this.focusedDay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 0,
              offset: const Offset(0, 0),
              color: colorForShadow,
            ),
          ]),
      child: ExpansionTile(
        textColor: black,
        tilePadding: const EdgeInsets.symmetric(horizontal: 10),
        onExpansionChanged: onExpansionChanged,
        childrenPadding: const EdgeInsets.only(left: 15, right: 55),
        collapsedIconColor: black,
        iconColor: black,
        title: TableCalendar(
          onDaySelected: onDaySelected,
          selectedDayPredicate: selectedDayPredicate,
          focusedDay: focusedDay ?? DateTime.now(),
          firstDay: DateTime.utc(2010, 10, 16),
          lastDay: DateTime.utc(2030, 3, 14),
          calendarFormat: calendarFormat!,
          //swipe horizontal by swipe
          availableGestures: AvailableGestures.horizontalSwipe,
          daysOfWeekHeight: 22,
          daysOfWeekStyle: DaysOfWeekStyle(
            dowTextFormatter: (date, locale) {
              return DateFormat('E').format(date)[0];
            },
            // weekdayStyle: blackBold12sp,
            // weekendStyle: blackBold12sp,
          ),
          //for month year visible
          calendarStyle: const CalendarStyle(
            // defaultTextStyle: calendarFormat == CalendarFormat.month
            //     ? blackSemiBold12sp
            //     : color94SemiBold11sp,
            // todayTextStyle: whiteSemiBold11sp,
            // selectedTextStyle: whiteSemiBold12sp,
            // weekendTextStyle: calendarFormat == CalendarFormat.month
            //     ? blackSemiBold12sp
            //     : color94SemiBold11sp,
            // outsideTextStyle: color94SemiBold11sp,
            todayDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.grey,
            ),
            selectedDecoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: primaryColor,
              backgroundBlendMode: BlendMode.srcOver,
            ),
          ),

          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            // titleTextStyle: blackSemiBold13sp,
            leftChevronIcon: Icon(Icons.chevron_left, color: black),
            rightChevronIcon: SizedBox(),
          ),
        ),
      ),
    );
  }
}
