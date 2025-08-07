import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {

  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final InputDecoration? inputDecoration;

  const CustomTextField({
    Key? key,
    this.controller,
    this.onSaved,
    this.validator,
    this.inputDecoration, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: inputDecoration,
      onSaved: onSaved,
      validator: validator,
    );
  }
}