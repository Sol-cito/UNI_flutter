import 'package:flutter/material.dart';

class CustTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String? hintText;
  final bool? isInputInvalid;
  final String? errorText;
  final bool? isObscure;

  const CustTextField({
    Key? key,
    required this.textEditingController,
    this.hintText,
    this.isInputInvalid,
    this.errorText,
    this.isObscure,
  }) : super(key: key);

  String? _getErrorText() {
    if (isInputInvalid != null &&
        isInputInvalid! &&
        errorText != null &&
        textEditingController.text.isNotEmpty) {
      return errorText!;
    }
    return null;
  }

  @override
  State<CustTextField> createState() => _CustTextFieldState();
}

class _CustTextFieldState extends State<CustTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
        cursorColor: Colors.black,
        controller: widget.textEditingController,
        obscureText: widget.isObscure == null ? false : widget.isObscure!,
        decoration: InputDecoration(
            hintText: widget.hintText ?? "",
            errorText: widget._getErrorText(),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black)),
            filled: true,
            fillColor: Colors.lightBlue));
  }
}
