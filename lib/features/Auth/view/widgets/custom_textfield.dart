import 'package:mayday/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final int? height;
  final int? width;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool? isObscure;
  final int? wordCount;
  final String? labelText;
  CustomTextField(
      {super.key,
      required this.textEditingController,
      this.height,
      this.width,
      this.prefixIcon,
      this.labelText,
      this.suffixIcon,
      this.isObscure,
      this.wordCount});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final AppColorsTheme _appColorsTheme = AppColorsTheme.dark();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.isObscure == null ? false : true,
      cursorColor: _appColorsTheme.highlight,
      style: TextStyle(color: _appColorsTheme.textDefault),
      decoration: InputDecoration(
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon,
          prefixIconColor: Colors.white54,
          suffixIconColor: Colors.white54,
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _appColorsTheme.snackBarFailure)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: _appColorsTheme.highlight)),
          labelText: widget.labelText,
          isDense: true,
          floatingLabelStyle: TextStyle(color: _appColorsTheme.highlight),
          focusColor: _appColorsTheme.highlight,
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white54))),
      controller: widget.textEditingController,
    );
  }
}
