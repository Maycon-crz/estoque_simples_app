import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? label;
  final Widget? suffixIconButton;
  final bool? activeObscureText;

  const CustomTextFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.label,
    this.suffixIconButton,
    this.activeObscureText,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.activeObscureText ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: _isObscure,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        suffixIcon: widget.suffixIconButton ??
            (widget.activeObscureText == true ? obscureTextFunction() : null),
      ),
    );
  }

  Widget? obscureTextFunction() {
    // activeObscureText == true ? obscureTextFunction :
    return IconButton(
      icon: Icon(
        _isObscure ? Icons.visibility : Icons.visibility_off,
      ),
      onPressed: () {
        setState(() {
          _isObscure = !_isObscure;
        });
      },
    );
  }
}
