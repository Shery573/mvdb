import 'package:flutter/material.dart';

import '../colors.dart';

SnackBar ViewSnackBar(BuildContext context, String text) {
  return SnackBar(
    backgroundColor: blue,
    content: Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: green,
      ),
    ),
  );
}