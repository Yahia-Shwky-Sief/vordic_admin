import 'package:flutter/material.dart';
import 'package:vordic_admin/core/theme/app_palette.dart';

Widget textFormField({
  required String hintText,
  required TextEditingController controller,
  required TextInputType keyboardType,
  required bool obscureText,
  required String? Function(String?)? validator,
}) {
  return SizedBox(
    height: 60,
    child: TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppPalette.whiteColor,
            width: 2,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );
}
