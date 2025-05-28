import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackBar(String? message, {bool isError = true, bool getXSnackBar = false, int? showDuration}) {
  if (message != null && message.isNotEmpty) {
    Get.dialog(
      Center(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            height: 250,
            width: (message.length * 15).toDouble().clamp(100.0, 300.0),
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isError ? Icons.error : Icons.check_circle, color: isError ? Colors.red : Colors.green, size: 50),
                const SizedBox(height: 20),
                Text(message, style: TextStyle(color: Colors.black, fontSize: 16), textAlign: TextAlign.center),
              ],
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );

    Future.delayed(Duration(seconds: showDuration ?? 2), () {
      if (Get.isDialogOpen ?? false) {
        Get.back();
      }
    });
  }
}
