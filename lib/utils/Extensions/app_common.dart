import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:taxi_booking/utils/Colors.dart';
import '../Constants.dart';

TextStyle boldTextStyle(
    {int? size,
    Color? color,
    FontWeight? weight,
    TextDecoration? textDecoration,
    double? letterSpacing}) {
  return TextStyle(
      fontSize: size != null ? size.toDouble() : textBoldSizeGlobal,
      color: color ?? textPrimaryColor,
      fontWeight: weight ?? FontWeight.bold,
      decoration: textDecoration ?? TextDecoration.none,
      letterSpacing: letterSpacing ?? 0);
}

// Primary Text Style
TextStyle primaryTextStyle({int? size, Color? color, FontWeight? weight}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textPrimarySizeGlobal,
    color: color ?? textPrimaryColor,
    fontWeight: weight ?? FontWeight.normal,
  );
}

// Secondary Text Style
TextStyle secondaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  TextDecoration? textDecoration,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
    color: color ?? textSecondaryColor,
    decoration: textDecoration ?? TextDecoration.none,
    fontWeight: weight ?? FontWeight.normal,
  );
}

void log(Object? value) {
  if (!kReleaseMode) print(value);
}

bool hasMatch(String? s, String p) {
  return (s == null) ? false : RegExp(p).hasMatch(s);
}

Color getColorFromHex(String hexColor, {Color? defaultColor}) {
  if (hexColor.isEmpty) {
    if (defaultColor != null) {
      return defaultColor;
    } else {
      throw ArgumentError('Can not parse provided hex $hexColor');
    }
  }

  hexColor = hexColor.toUpperCase().replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  return Color(int.parse(hexColor, radix: 16));
}

// void toast(String? value,
//     {ToastGravity? gravity,
//     length = Toast.LENGTH_SHORT,
//     Color? bgColor,
//     Color? textColor,
//     bool print = false}) {
//   if (value!.isEmpty || (!kIsWeb && Platform.isLinux)) {
//     log(value);
//   } else {
//     Fluttertoast.showToast(
//       msg: value.validate(),
//       gravity: gravity,
//       toastLength: length,
//       backgroundColor: bgColor,
//       textColor: textColor,
//       timeInSecForIosWeb: 2,
//     );
//     if (print) log(value);
//   }
// }

/// Launch a new screen
Future<T?> launchScreen<T>(BuildContext context, Widget child,
    {bool isNewTask = false,
    PageRouteAnimation? pageRouteAnimation,
    Duration? duration}) async {
  if (isNewTask) {
    return await Navigator.of(context).pushAndRemoveUntil(
      buildPageRoute(child, pageRouteAnimation, duration),
      (route) => false,
    );
  } else {
    return await Navigator.of(context).push(
      buildPageRoute(child, pageRouteAnimation, duration),
    );
  }
}

enum PageRouteAnimation { Fade, Scale, Rotate, Slide, SlideBottomTop }

Route<T> buildPageRoute<T>(
    Widget? child, PageRouteAnimation? pageRouteAnimation, Duration? duration) {
  if (pageRouteAnimation != null) {
    if (pageRouteAnimation == PageRouteAnimation.Fade) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) =>
            FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 1000),
      );
    } else if (pageRouteAnimation == PageRouteAnimation.Rotate) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) =>
            RotationTransition(child: child, turns: ReverseAnimation(anim)),
        transitionDuration: Duration(milliseconds: 700),
      );
    } else if (pageRouteAnimation == PageRouteAnimation.Scale) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) =>
            ScaleTransition(child: child, scale: anim),
        transitionDuration: Duration(milliseconds: 700),
      );
    } else if (pageRouteAnimation == PageRouteAnimation.Slide) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) => SlideTransition(
          child: child,
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
              .animate(anim),
        ),
        transitionDuration: Duration(milliseconds: 500),
      );
    } else if (pageRouteAnimation == PageRouteAnimation.SlideBottomTop) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) => SlideTransition(
          child: child,
          position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
              .animate(anim),
        ),
        transitionDuration: Duration(milliseconds: 500),
      );
    }
  }
  return MaterialPageRoute<T>(builder: (_) => child!);
}
