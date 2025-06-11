import 'package:flutter/material.dart';

class SnackBarMessage{

  void showSuccessSnackBar({required String message, required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.greenAccent,
        content: Text(message)));
  }

  void showErrorSnackBar({required String message, required BuildContext context}){
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(message)));

  }
}