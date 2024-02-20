// import 'package:flutter/material.dart';
// import 'package:work/core/utils/color_manager.dart';
// import 'package:work/core/utils/font_manager.dart';
// import 'package:work/core/utils/styles_manager.dart';
// import 'package:work/core/utils/values_manager.dart';
//
// class DropdownMenuWidget extends StatelessWidget {
//   const DropdownMenuWidget({super.key,
//     required this.value,
//     required this.valueList,
//     required this.onChanged,
//     this.borderColor,
//     this.dropdownMenuItemList,
//     this.height,
//     this.icon,
//     this.isExpanded,
//   this.flex,
//   this.color,});
//   final String value;
//   final List<String> valueList;
//   final ValueChanged<String?>? onChanged;
//   final Color? borderColor;
//   final List<DropdownMenuItem<String>>? dropdownMenuItemList;
//   final double? height;
//   final Widget? icon;
//   final bool? isExpanded;
//   final int? flex;
//   final Color? color;
//
//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       flex:flex??1,
//       child:   Container(
//         alignment: isExpanded??true?AlignmentDirectional.centerStart:AlignmentDirectional.centerEnd,
//         height: height??AppSize.s36,
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: borderColor??ColorManager.grey,
//           ),
//           color:color??ColorManager.transparent,
//         ),
//         child: DropdownButton(
//           dropdownColor: ColorManager.white,
//           elevation: 8,
//           isExpanded: isExpanded??true,
//           underline: Container(),
//           focusColor: Colors.transparent,
//           iconSize: AppSize.s20,
//           padding: const EdgeInsets.all(AppPadding.p4),
//           icon: icon??Icon(Icons.arrow_drop_down),
//           value: value,
//           hint: Text(
//             value,
//             maxLines: 1,
//             overflow: TextOverflow.ellipsis,
//           ),
//           items: dropdownMenuItemList??valueList.map((option2) {
//             return DropdownMenuItem(
//               value: option2,
//               child: Text(
//                 option2,
//                 overflow: TextOverflow.ellipsis,
//                 maxLines: 1,
//                 style: getLightStyle(
//                     fontSize: FontSize.s12,
//                     color: ColorManager.black),
//               ),
//             );
//           }).toList(),
//           onChanged: onChanged,
//         ),
//       ),
//     );
//   }
// }
