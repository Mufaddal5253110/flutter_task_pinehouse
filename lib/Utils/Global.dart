import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Global {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static showSnackBar(Widget content, BuildContext context) =>
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: content));
}
