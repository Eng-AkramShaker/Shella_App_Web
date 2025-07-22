import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';

void showConfirmationDialog({
  required BuildContext context,
  String? title,
  String? description,
  VoidCallback? onConfirmed,
  VoidCallback? onCancelled,
  DialogType dialogType = DialogType.warning,
  AnimType animType = AnimType.bottomSlide,
  bool showCloseIcon = true,
  String? confirmText,
  String? cancelText,
}) {
  final isArabic = context.locale.languageCode == 'ar';

  AwesomeDialog(
    context: context,
    dialogType: dialogType,
    animType: animType,
    headerAnimationLoop: false,
    showCloseIcon: showCloseIcon,
    btnCancelText: cancelText ?? (isArabic ? "إلغاء" : "Cancel"),
    btnOkText: confirmText ?? (isArabic ? "تأكيد" : "Confirm"),
    title: title ?? (isArabic ? "تأكيد" : "Confirmation"),
    desc: description ?? (isArabic ? "هل أنت متأكد؟" : "Are you sure?"),
    btnCancelOnPress: onCancelled ?? () {},
    btnOkOnPress: onConfirmed ?? () {},
    btnOkColor: Colors.green,
    btnCancelColor: Colors.grey.shade400,
  ).show();
}
