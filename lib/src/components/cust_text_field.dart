import 'package:flutter/material.dart';

class CustTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final ValueChanged<String>? onChange;
  final String? hintText;
  final bool? isInputInvalid;
  final String? errorText;
  final bool? isObscure;
  final int? maxLength;

  const CustTextField(
      {Key? key,
      required this.textEditingController,
      this.hintText,
      this.isInputInvalid,
      this.errorText,
      this.isObscure,
      this.maxLength,
      this.onChange})
      : super(key: key);

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
      maxLength: widget.maxLength,
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
          fillColor: Colors.lightBlue),
      onChanged: widget.onChange,
    );
  }
}
