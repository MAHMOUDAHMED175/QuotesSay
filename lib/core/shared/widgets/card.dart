// import 'package:flutter/material.dart';
// import 'package:work/core/utils/color_manager.dart';
// import 'package:work/core/utils/font_manager.dart';
// import 'package:work/core/utils/styles_manager.dart';
// import 'package:work/core/utils/values_manager.dart';
//
// import '../../utils/values_manager.dart';
//
// class SelectCard extends StatelessWidget {
//   const SelectCard({
//     Key? key,
//     this.icon,
//     required this.title,
//     required this.imageOr,
//     this.elevation,
//     this.image,
//   }) : super(key: key);
//
//   final IconData? icon;
//   final String title;
//   final bool imageOr;
//   final String? image;
//   final double? elevation;
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         height: AppSize.s80,
//         width: AppSize.s80,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(30),
//           color: ColorManager.white,
//         ),
//         child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             // mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               imageOr
//                   ? Expanded(
//                       child: SizedBox(
//                           height: AppPadding.p30,
//                           width: AppPadding.p30,
//                           child: Image.asset(
//                             image!,
//                             fit: BoxFit.contain,
//                           )))
//                   : Icon(icon,
//                       size: AppSize.s16,
//                       color: ColorManager
//                           .backgroundButtonsAndBackgroundSomeWidgets),
//               const SizedBox(
//                 height: AppSize.s12,
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(AppPadding.p8),
//                 child: Text(title,
//                     style: getLightStyle(
//                         color: ColorManager.black, fontSize: FontSize.s14)),
//               ),
//             ]));
//   }
// }
