// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';

void showCustomSnackBar(BuildContext context, String? message, {bool isError = true, int? showDuration}) {
  if (message != null && message.isNotEmpty) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        Future.delayed(Duration(seconds: showDuration ?? 2), () {
          if (Navigator.of(dialogContext, rootNavigator: true).canPop()) {
            nav.back();
          }
        });

        return Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              height: 250,
              width: (message.length * 15).toDouble().clamp(100.0, 300.0),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    isError ? Icons.error : Icons.check_circle,
                    color: isError ? Colors.red : Colors.green,
                    size: 50,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    message,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
