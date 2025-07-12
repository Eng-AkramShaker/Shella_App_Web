import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/drop_choice/drop_choice.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/join_as_driver/controllers/join_as_driver_controller.dart';
import 'package:shella_design/features/join_as_driver/widgets/apply_button.dart';
import 'package:shella_design/features/join_as_driver/widgets/type_of_work_row.dart';
import 'package:shella_design/features/join_as_driver/widgets/upload_profile_dotted.dart';
import 'package:shella_design/common/util/app_styles.dart';
import '../../../common/widgets/textField/custom_textfield_2.dart';
import '../../../common/util/app_colors.dart';

class JoinAsDriverTwo extends StatefulWidget {
  const JoinAsDriverTwo({super.key});

  @override
  State<JoinAsDriverTwo> createState() => _JoinAsDriverTwoState();
}

class _JoinAsDriverTwoState extends State<JoinAsDriverTwo> {
  File? licenseImage;

  Future<void> _selectLicnsePicture(BuildContext context) async {
    final picker = ImagePicker();
    final photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      context
          .read<DriverRegisterController>()
          .setLicensePicture(File(photo.path));
      debugPrint('✅ تم تحديد صورة الشهادة : $photo');
      setState(() {
        licenseImage = File(photo.path);
      });
    }
  }

  final TextEditingController identityNumberController =
      TextEditingController();
  bool acceptConditions = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Future<void> _register(BuildContext context) async {
    context
        .read<DriverRegisterController>()
        .setIdentityNumber(identityNumberController.text);

    final controller = context.read<DriverRegisterController>();

    debugPrint('phone after phone picker: ${controller.phone}');

    if (controller.earning.isEmpty ||
        controller.licensePicture == null ||
        controller.zoneId.isEmpty ||
        controller.vechileId.isEmpty ||
        controller.identityType.isEmpty ||
        controller.identityNumber.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: const Text('Please fill all fields!')));
      debugPrint('❌ بيانات غير مكتملة للتسجيل');
      return;
    }
    bool success = await controller.registerDriver();

    if (success) {
      debugPrint('✅ تم تسجيل الدليفري مان');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم تسجيل الدليفري مان')),
      );
    } else {
      debugPrint('❌فشل التسجيل تاكد من ملئ جميع الخانات ');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('❌فشل التسجيل تاكد من ملئ جميع الخانات '),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.backgroundColor,
        title: Custom_Text(
          context,
          text: 'الرجاء ملئ الاستمارة ',
          style: font14Black400W(context),
        ),
        centerTitle: true,
        elevation: 8.0,
        shadowColor: AppColors.gryColor_5,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TypeOfWorkRow(),
              SizedBox(
                height: 30.h,
              ),
              DropChoice(
                provider: context.read<DriverRegisterController>().setVechileId,
                title: 'حدد نوع المركبة',
                titleChoiceOne: 'دراجة نارية',
                titleChoiceTwo: 'مركبة',
                height: 31.h,
                width: double.infinity,
                titleBackgroundColor: AppColors.gryColor_5.withOpacity(.5),
                titleStyle: font10Black600W(context),
                titleChoiceStyle: font10Black400W(context),
              ),
              SizedBox(
                height: 30.h,
              ),
              DropChoice(
                provider:
                    context.read<DriverRegisterController>().setIdentityType,
                title: 'حدد نوع الرخصة',
                titleChoiceOne: 'جواز سفر',
                titleChoiceTwo: 'رخصة قيادة',
                height: 31.h,
                width: double.infinity,
                titleBackgroundColor: AppColors.gryColor_5.withOpacity(.5),
                titleStyle: font10Black600W(context),
                titleChoiceStyle: font10Black400W(context),
              ),
              SizedBox(
                height: 20.h,
              ),
              Custom_Text(
                context,
                text: 'رقم الهوية',
                style: font14Black500W(context),
              ),
              SizedBox(
                height: 10,
              ),
              CustomTextField(
                controller: identityNumberController,
                labelText: 'EX:XXXXX-XXXXXXX-X',
                borderColor: AppColors.gryColor_5,
                prefixIcon: Icon(Icons.perm_identity),
              ),
              SizedBox(
                height: 20.h,
              ),
              UploadProfilePhotoDotted(
                licensePicture: licenseImage,
                onTap: () => _selectLicnsePicture(context),
              ),
              Row(
                children: [
                  Checkbox(
                      value: acceptConditions,
                      checkColor: AppColors.backgroundColor,
                      activeColor: AppColors.greenColor,
                      onChanged: (value) {
                        setState(() {
                          acceptConditions = value ?? false;
                        });
                      }),
                  Custom_Text(context,
                      text: 'اوافق على الشروط والأحكام وسياسة الخصوصية',
                      style: font11Grey400W(context))
                ],
              ),
              ApplyButton(
                onTap: () => _register(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
