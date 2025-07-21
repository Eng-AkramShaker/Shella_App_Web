// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void copyToClipboard(BuildContext context, TextEditingController _controller) {
  String textToCopy = _controller.text; // Get the text from the text field

  if (textToCopy.isNotEmpty) {
    // Check if there's text to copy
    Clipboard.setData(ClipboardData(text: textToCopy)); // Copy to clipboard

    // Optional: Show a snackbar or other feedback to the user
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Text copied!')),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('No text to copy!')),
    );
  }
}
