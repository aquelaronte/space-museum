import 'package:flutter/material.dart';

class AuthTextfield extends StatefulWidget {
  final TextEditingController controller;
  final String placeholder;
  final bool isPassword;
  final double top;
  final double bottom;
  final double left;
  final double right;

  const AuthTextfield({
    super.key,
    required this.controller,
    required this.placeholder,
    this.top = 0,
    this.bottom = 0,
    this.left = 0,
    this.right = 0,
    this.isPassword = false,
  });

  @override
  State<AuthTextfield> createState() => _AuthTextfieldState();
}

class _AuthTextfieldState extends State<AuthTextfield> {
  bool _obscureText = true;

  Widget _getTextField() {
    if (widget.isPassword) {
      return TextField(
        obscureText: _obscureText,
        controller: widget.controller,
        decoration: InputDecoration(
            labelText: widget.placeholder,
            suffixIcon: IconButton(
              icon:
                  Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
      );
    } else {
      return TextField(
        controller: widget.controller,
        decoration: InputDecoration(
            labelText: widget.placeholder,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)))),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
          top: widget.top,
          bottom: widget.bottom,
          left: widget.left,
          right: widget.right),
      child: _getTextField(),
    );
  }
}
