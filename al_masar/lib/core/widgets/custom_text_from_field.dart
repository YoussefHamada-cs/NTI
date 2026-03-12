import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    required this.validator,
    this.onSaved,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.suffixIcon,
    this.inputFormatters,
    this.prefixIcon,
  });
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?) validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: TextFormField(
            controller: controller,
            onSaved: onSaved,
            keyboardType: keyboardType,
            obscureText: obscureText,

            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: theme.textTheme.bodyLarge!.copyWith(
                color: Color(0xFF999999),
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
              filled: true,
              fillColor: Colors.white,
              border: buildBorder(),
              enabledBorder: buildBorder(),
              focusedBorder: focusedBorder(),
              errorBorder: errorBoder(),
              focusedErrorBorder: errorBoder(),
              suffixIcon: suffixIcon,
              prefixIcon: prefixIcon,
              prefixIconColor: Color(0xFF1380A5),
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            validator: validator,
            inputFormatters: inputFormatters,
          ),
        ),
      ),
    );
  }

  OutlineInputBorder errorBoder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(color: Colors.red),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),
      borderSide: const BorderSide(color: Colors.white),
    );
  }

  OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(7),

      borderSide: const BorderSide(color: Colors.white),
    );
  }
}
