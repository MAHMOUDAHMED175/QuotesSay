import 'package:flutter/material.dart';

import '../../utils/color_manager.dart';
import '../../utils/values_manager.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function()? suffixPressd,
  Function()? taped,
  String? Function(String?)? validate,
  bool isPassword = false,
  String? Function(String?)? submit,
  String? Function(String?)? change,
  IconData? suffixIcon,
  String? hintText,
  labelText,
  IconData? prefix,
  Color? fillsColor,
  Color? enabledBorderColor,
  Color? focusedBorderColor,
  bool? readOnly,
  BorderRadius? border,
  int? flex,
  required BuildContext context,
  colorSuffixIcon,
}) =>
    TextFormField(
      textAlign: TextAlign.center,
      keyboardType: type,
      controller: controller,
      obscureText: isPassword,
      onFieldSubmitted: (s) {
        submit!(s);
      },
      validator: validate,
      onChanged: change,
      onTap: taped,
      readOnly: readOnly ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(2),
        hintStyle: TextStyle(
          color: ColorManager.grey200,
          // تغيير لون الـ hint إلى اللون الأزرق
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppPadding.p4),
          borderSide: BorderSide(color: focusedBorderColor!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: border ?? BorderRadius.circular(AppPadding.p8),
          borderSide: BorderSide(color: enabledBorderColor!),
        ),
        filled: true,
        fillColor: fillsColor ?? ColorManager.white,
        prefixIcon: prefix != null ? Icon(prefix) : null,
        hintText: hintText,
        suffixIcon: suffixIcon != null
            ? SizedBox(
                // width: MediaQuery.sizeOf(context).width * 0.03,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (suffixIcon != null)
                      Container(
                        height: AppSize.s20,
                        width: 1.5,
                        color: ColorManager.black,
                      ),
                    if (suffixIcon != null)
                      const SizedBox(
                        width: AppSize.s8,
                      ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.01,
                      child: IconButton(
                        onPressed: () {
                          suffixPressd!();
                        },
                        icon: Icon(
                          suffixIcon,
                          size: AppSize.s20,
                          color: colorSuffixIcon ?? ColorManager.grey200,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            : null,
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
    );
