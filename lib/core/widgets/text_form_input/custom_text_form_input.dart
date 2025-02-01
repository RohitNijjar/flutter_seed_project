import 'package:flutter/material.dart';

class CustomTextFormInput extends StatefulWidget {
  const CustomTextFormInput({
    super.key,
    required this.controller,
    required this.hintText,
    this.validator,
    this.inputType = TextInputType.text,
    this.obscureText = false,
    this.iconStart,
    this.iconEnd,
  });

  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final TextInputType inputType;
  final bool obscureText;
  final IconData? iconStart;
  final IconData? iconEnd;

  @override
  State<CustomTextFormInput> createState() => _CustomTextFormInputState();
}

class _CustomTextFormInputState extends State<CustomTextFormInput> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        hintText: widget.hintText,
        prefixIcon: Icon(widget.iconStart),
        suffixIcon: widget.inputType == TextInputType.visiblePassword
            ? IconButton(
                icon:
                    Icon(obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
              )
            : Icon(widget.iconEnd),
      ),
      keyboardType: widget.inputType,
      validator: widget.validator,
      obscureText: obscureText,
    );
  }
}
