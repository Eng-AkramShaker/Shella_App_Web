import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class UploadProfilePhotoDotted extends StatelessWidget {
  final void Function()? onTap;
  final File? licensePicture;
  const UploadProfilePhotoDotted({
    super.key,
    this.onTap,
    this.licensePicture,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: licensePicture == null
          ? DottedBorder(
              borderType: BorderType.RRect,
              strokeWidth: 1,
              dashPattern: [6, 3],
              color: AppColors.gryColor_5,
              radius: Radius.circular(8.r),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(25.sp),
                child: Column(
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: AppColors.gryColor_5,
                    ),
                    Custom_Text(context,
                        textAlign: TextAlign.center,
                        text: 'تحميل صورة الملف\nالشخصي',
                        style: font11Grey400W(context)),
                    if (licensePicture != null)
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Image.file(licensePicture!,
                            height: 70, fit: BoxFit.cover),
                      )
                  ],
                ),
              ),
            )
          : Center(
              child: SizedBox(
                height: 130,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(12),
                  child: Image.file(
                    licensePicture!,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
    );
  }
}
