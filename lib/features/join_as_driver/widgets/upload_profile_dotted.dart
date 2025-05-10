import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_styles.dart';

class UploadProfilePhotoDotted extends StatelessWidget {
  const UploadProfilePhotoDotted({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
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
          ],
        ),
      ),
    );
  }
}
