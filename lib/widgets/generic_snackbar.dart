import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

showSnackBar({required BuildContext context, required String message}) {
  var snackBar = SnackBar(
    content: Text(message),
    behavior: SnackBarBehavior.floating,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
