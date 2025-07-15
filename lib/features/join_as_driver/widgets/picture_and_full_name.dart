import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/features/join_as_driver/controllers/join_as_driver_controller.dart';
import '../../../common/widgets/texts/custom_text.dart';
import '../../../common/util/app_colors.dart';
import '../../../common/util/app_styles.dart';

class PictureAndFullName extends StatelessWidget {
  final File? profilePicture;
  final VoidCallback onSelectPicture;
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;

  const PictureAndFullName(
      {super.key,
      this.profilePicture,
      required this.onSelectPicture,
      required this.firstNameController,
      required this.lastNameController});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onSelectPicture,
          child: profilePicture == null
              ? DottedBorder(
                  borderType: BorderType.RRect,
                  strokeWidth: 1,
                  dashPattern: [6, 3],
                  color: AppColors.gryColor_5,
                  radius: Radius.circular(30.r),
                  child: Container(
                      width: 150.w,
                      height: 110.h,
                      padding: profilePicture == null ? EdgeInsets.all(25.sp) : EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Icon(Icons.camera_alt_outlined, color: AppColors.gryColor_5),
                          Custom_Text(context,
                              textAlign: TextAlign.center, text: 'تحميل صورة الملف\nالشخصي', style: font11Grey400W(context)),
                        ],
                      )))
              : Center(
                  child: SizedBox(
                    height: 130,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        profilePicture!,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
        ),
        SizedBox(height: 20.h),
        Row(
          children: [
            Expanded(
              child: CustomTextField(
                controller: firstNameController,
                borderColor: AppColors.gryColor_5,
                labelText: 'الاسم الأول',
                prefixIcon: Icon(Icons.person_outline_outlined),
                onChanged: (val) {
                  context.read<DriverRegisterController>().setFirstName(val);
                },
              ),
            ),
            SizedBox(width: 20.w),
            Expanded(
              child: CustomTextField(
                controller: lastNameController,
                borderColor: AppColors.gryColor_5,
                labelText: 'اسم العائلة',
                prefixIcon: Icon(Icons.person_outline_outlined),
                onChanged: (val) {
                  context.read<DriverRegisterController>().setLastName(val);
                },
              ),
            )
          ],
        )
      ],
    );
  }
}
