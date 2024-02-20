// import 'package:flutter/material.dart';
//
// Widget DefaultDropdownMenuButton({
//   required String value,
//   required Text hint,
//   required bool isExpanded,
//   required List<DropdownMenuItem<String>> listOfDropdownMenuItem,
//   required void Function(dynamic)? onChange,
// }) =>
//     Padding(
//       padding: const EdgeInsets.all(AppPadding.p8),
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
//         iconEnabledColor: ColorManager.white,
//         iconDisabledColor: ColorManager.white,
//         icon: Icon(
//           Icons.arrow_forward_ios,
//           color: ColorManager.backgroundButtonsAndBackgroundSomeWidgets,
//           size: 16,
//         ),
//         padding: EdgeInsets.all(AppPadding.p8),
//         alignment: Alignment.center,
//         borderRadius: BorderRadius.all(Radius.circular(30)),
//         // elevation: 5,
//         menuMaxHeight: AppSize.s400,
//       ),
//     );
