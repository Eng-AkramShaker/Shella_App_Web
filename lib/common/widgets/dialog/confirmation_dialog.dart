import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ConfirmationDialog extends StatelessWidget {
  final String title;
  final String description;
  final String confirmButtonText;
  final String cancelButtonText;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;
  final Color? primaryColor;
  final Color? secondaryColor;

  const ConfirmationDialog({
    super.key,
    required this.title,
    required this.description,
    required this.confirmButtonText,
    required this.cancelButtonText,
    required this.onConfirm,
    required this.onCancel,
    this.primaryColor,
    this.secondaryColor,
  });

  @override
  Widget build(BuildContext context) {
    final appPrimaryColor = primaryColor ?? AppColors.primaryColor;
    final appSecondaryColor = secondaryColor ?? AppColors.secondaryColor;
    const String logoPath = 'assets/images/logo.png';

    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.85,
        ),
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            // Dialog content
            Container(
              padding: EdgeInsets.fromLTRB(20.w, 60.h, 20.w, 20.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 20.h),
                  Custom_Text(
                    context,
                    text: title,
                    style: TextStyle(
                      fontFamily: 'ReadexPro',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: appPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 15.h),
                  Custom_Text(
                    context,
                    text: description,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'ReadexPro',
                      fontSize: 14.sp,
                      color: AppColors.gryColor_2,
                    ),
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onCancel,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: AppColors.gryColor,
                            side: BorderSide(
                              color: appPrimaryColor,
                              width: 1.5,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          child: Text(
                            cancelButtonText,
                            style: TextStyle(
                              fontFamily: 'ReadexPro',
                              fontSize: 14.sp,
                              color: AppColors.gryColor,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onConfirm,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appSecondaryColor,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                          ),
                          child: Text(
                            confirmButtonText,
                            style: TextStyle(
                              fontFamily: 'ReadexPro',
                              fontSize: 14.sp,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Logo positioned half outside the dialog
            Positioned(
              top: -55.h,
              child: Container(
                width: 110.w,
                height: 110.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                  border: Border.all(
                    color: appPrimaryColor,
                    width: 2,
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    logoPath,
                    width: 95.w,
                    height: 95.h,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Helper function to show the confirmation dialog
Future<bool?> showConfirmationDialog({
  required BuildContext context,
  required String title,
  required String description,
  String confirmButtonText = 'تأكيد',
  String cancelButtonText = 'إلغاء',
  required Function() onConfirm,
  Function()? onCancel,
  Color? primaryColor,
  Color? secondaryColor,
}) async {
  return await showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return ConfirmationDialog(
        title: title,
        description: description,
        confirmButtonText: confirmButtonText,
        cancelButtonText: cancelButtonText,
        onConfirm: () {
          onConfirm();
          Navigator.of(context).pop(true);
        },
        onCancel: onCancel ??
            () {
              Navigator.of(context).pop(false);
            },
        primaryColor: primaryColor,
        secondaryColor: secondaryColor,
      );
    },
  );
}
