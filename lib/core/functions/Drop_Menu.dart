// import 'package:flutter/material.dart';
//
// class DropdownButton_widget extends StatelessWidget {
//   final String title;
//   final bool isColorBlack;
//   final List<String> menuItems;
//   Function function;
//
//
//   DropdownButton_widget({
//     required this.title,
//     required this.isColorBlack,
//     required this.menuItems,
//     required this.function,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           overflow: TextOverflow.ellipsis,
//           maxLines: 1,
//           textAlign: TextAlign.start,
//           style: getBoldStyle(
//               color: isColorBlack?ColorManager.black:ColorManager.grey400,
//               fontSize: AppSize.s14),
//         ),
//         Expanded(
//           child: DropdownButton(
//               isExpanded: true,
//               value: "من فضلك اختر",
//               hint: Text("من فضلك اختر"),
//               items: [],
//     // menuItems.map((op) {
//               //   return DropdownMenuItem(
//               //     value: ,
//               //     child: Text(
//               //       op,
//               //       style: getLightStyle(
//               //           fontSize: FontSize.s12,
//               //           color: ColorManager.black),
//               //     ),
//               //   );
//               // } ).toList()
//               //
//
//
//                 // if(menuItems.length !=0)
//                 //   for(int i=0;i<menuItems.length;i++)
//                 //     DropdownMenuItem(child: Text( menuItems[i].toString() ))
//               onChanged: (value) => function,),
//         )
//       ],
//     );
//   }
// }
