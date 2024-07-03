import 'package:flutter/material.dart';

class CustomShowDialog extends StatelessWidget {
  const CustomShowDialog(
      {super.key,
      required this.title,
      required this.content,
      required this.childTextButton});
  final Widget? title;
  final Widget? content;
  final Widget childTextButton;
  @override
  Widget build(BuildContext context) {
    return Center(
        child: AlertDialog(
      title: title,
      content: content,
      actions: <Widget>[TextButton(onPressed: () {}, child: childTextButton)],
      elevation: 24.0,
    ));
  }
}
