import 'package:flutter/material.dart';

class CustomTextformfield extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? icon;
  final bool obscureText;
  final String? Function(String?)? validator;
  final int? mline;
  final TextInputType? keyboardType;

  const CustomTextformfield({
    super.key,
    required this.controller,
    required this.hintText,
    this.icon,
    required this.obscureText,
    this.validator,
    this.keyboardType, this.mline,
  });

  @override
  State<CustomTextformfield> createState() => _CustomTextformfieldState();
}

class _CustomTextformfieldState extends State<CustomTextformfield> {
  bool _isObscured = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: widget.mline??1,
      keyboardType: widget.keyboardType,
      obscureText: widget.obscureText ? !_isObscured : widget.obscureText,
      controller: widget.controller,
      validator: widget.validator,


      style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: Colors.white,
          ),
      decoration: InputDecoration(
          suffixIcon: widget.obscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isObscured = !_isObscured;
                    });

                  },
                  icon:
                      Icon(_isObscured ? Icons.visibility : Icons.visibility_off ))
              : null,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Theme.of(context).hintColor,
          ),
          filled: true,
          prefixIcon: widget.icon!=null? Icon(widget.icon):null,
          fillColor: Color.fromARGB(255, 68, 92, 100),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(3),
              borderSide: BorderSide(color: Colors.grey))),
    );
  }
}
