import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:localloud/utils/theme/theme.dart';

class AuthTextField extends StatefulWidget {
  final TextEditingController? controller;
  final bool isPasswordField;
  final String hintText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  const AuthTextField({
    super.key,
    this.controller,
    this.isPasswordField = false,
    required this.hintText,
    this.prefixIcon,
    this.validator,
  });

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPasswordField ? isObscure : false,
      validator: widget.validator,
      style: GoogleFonts.fredoka(
        fontSize: double.tryParse("15.0"),
        fontWeight: FontWeight.w500,
        color: AppColors.lightBackground,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 2.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.deepPurple, width: 3.0),
        ),
        hintText: widget.hintText,
        hintStyle: GoogleFonts.fredoka(
          fontSize: double.tryParse("15.0"),
          fontWeight: FontWeight.w500,
          color: AppColors.lightBackground,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Icon(
                widget.prefixIcon,
                color: AppColors.lightBackground,
              )
            : null,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  isObscure ? Icons.visibility : Icons.visibility_off,
                  color: AppColors.lightBackground,
                ),
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
              )
            : null,
      ),
    );
  }
}
