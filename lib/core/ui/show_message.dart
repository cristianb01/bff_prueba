import 'package:bff_prueba/core/constants/theme.dart';
import 'package:flutter/material.dart';

class ShowMessage {
  ShowMessage(
      {this.isWarning = false,
      this.isSuccess = false,
      this.isError = false,
      required this.message,
      this.context});
  bool isSuccess;
  bool isError;
  bool isWarning;
  String message;
  final context;

  show() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: _getColor(),
        behavior: SnackBarBehavior.floating,
        content: Text(message)));
  }

  _getColor() {
    var color;
    if (isSuccess) color = SUCCESS_BG_COLOR;
    if (isError) color = ERROR_BG_COLOR;
    if (isWarning) color = WARNING_BG_COLOR;
    return color;
  }
}
