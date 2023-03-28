import 'package:flutter/material.dart';
import 'package:uni_flutter/src/common/common_constant.dart';

class CustConfirmDialog extends StatefulWidget {
  final String title;
  final String content;

  const CustConfirmDialog({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  @override
  State<CustConfirmDialog> createState() => _CustConfirmDialogState();
}

class _CustConfirmDialogState extends State<CustConfirmDialog> {
  _onPressConfirm() => {Navigator.pop(context), Navigator.pop(context)};

  _onPressCancel() => {Navigator.pop(context)};

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.content),
      actions: [
        TextButton(
            onPressed: _onPressConfirm,
            child: const Text(custDialogConfirmText)),
        TextButton(
            onPressed: _onPressCancel, child: const Text(custDialogCancelText))
      ],
    );
  }
}
