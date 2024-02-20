import 'package:flutter/material.dart';
import 'package:windowappflutter/core/utils/responsive.dart';

abstract class StyleHelper {
  //regular
  static TextStyle textStyle12Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle14Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle16Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle18Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle20Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle22Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 22),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle24Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle26Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 26),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle28Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle30Regular(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w400,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  //medium
  static TextStyle textStyle12Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle14Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle16Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle18Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle20Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle22Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 22),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle24Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle26Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 26),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle28Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle30Medium(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w600,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  //bold

  static TextStyle textStyle12Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 12),
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle14Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 14),
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle16Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 16),
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle18Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 18),
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle20Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 20),
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle22Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w800,
      color: color,
      overflow: TextOverflow.ellipsis,
    );
  }

  static TextStyle textStyle24Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 24),
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle26Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 26),
      fontWeight: FontWeight.w800,
      color: color,
    );
  }

  static TextStyle textStyle28Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 28),
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle30Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 30),
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.ellipsis);
  }

  static TextStyle textStyle50Bold(
    BuildContext context, {
    required Color color,
  }) {
    return TextStyle(
        fontSize: getResponsiveFontSize(context, fontSize: 60),
        fontWeight: FontWeight.w800,
        color: color,
        overflow: TextOverflow.ellipsis);
  }
}

double getResponsiveFontSize(BuildContext context, {required double fontSize}) {
  double scaleFactor = calculateScaleFactor(context);
  double responsiveSize = fontSize * scaleFactor;
  return responsiveSize.clamp(fontSize * 0.8, fontSize * 1.2);
}

//fittedBox
//aspectRation
//layoutbuilder
double calculateScaleFactor(BuildContext context) {
  double layoutWidth = MediaQuery.sizeOf(context).width;
  if (Responsive.isMobile(context)) {
    return layoutWidth / 550;
  } else if (Responsive.isTablet(context)) {
    return layoutWidth / 1000;
  } else {
    return layoutWidth / 2500;
  }
}
