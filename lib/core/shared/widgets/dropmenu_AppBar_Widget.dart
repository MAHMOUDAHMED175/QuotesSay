// import 'package:flutter/material.dart';
// import 'package:work/core/utils/color_manager.dart';
// import 'package:work/core/utils/values_manager.dart';
//
// Widget DropdownMenuButton({
//   required String value,
//   required Text hint,
//   required bool isExpanded,
//   required List<DropdownMenuItem<String>> listOfDropdownMenuItem,
//   required void Function(dynamic)? onChange,
// }) =>
//     Padding(
//       padding: EdgeInsets.all(AppPadding.p8 ),
//       child: DropdownButton<String>(
//         isExpanded: isExpanded,
//         value: value,
//         hint: hint,
//         items: listOfDropdownMenuItem,
//         onChanged: onChange,
//         underline: Container(),
//         dropdownColor: ColorManager.white,
//         focusColor: ColorManager.white,
//         iconSize: 16,
//         iconEnabledColor: ColorManager.backgroundButtonsAndBackgroundSomeWidgets,
//         iconDisabledColor: ColorManager.white,
//         padding: EdgeInsets.all(AppPadding.p8),
//         alignment: Alignment.center,
//         borderRadius: BorderRadius.all(Radius.circular(30)),
//         // elevation: 5,
//         menuMaxHeight: AppSize.s400,
//       ),
//     );
