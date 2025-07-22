import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/common/widgets/drop_choice/drop_choice.dart';
import 'package:shella_design/common/widgets/loading_progress/loading/green_loading_circle.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/join_as_driver/controllers/join_as_driver_controller.dart';
import 'package:shella_design/features/join_as_driver/widgets/build/mobile/build_row_conditions.dart';
import 'package:shella_design/features/join_as_driver/widgets/mobile/apply_button.dart';
import 'package:shella_design/features/join_as_driver/widgets/mobile/type_of_work_row.dart';
import 'package:shella_design/features/join_as_driver/widgets/mobile/upload_profile_dotted.dart';
import 'package:shella_design/common/util/app_styles.dart';
import '../../../../common/widgets/textField/custom_textfield_2.dart';
import '../../../../common/util/app_colors.dart';

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
      // showCustomSnackBar('❌ بيانات غير مكتملة للتسجيل', isError: true);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('بيانات غير مكتملة')));
      debugPrint('❌ بيانات غير مكتملة للتسجيل');
      return;
    }
    controller.isLoading == true;
    bool success = await controller.registerDriver();

    if (success) {
      controller.isLoading = false;
      debugPrint('✅ تم تسجيل الدليفري مان');
      showCustomSnackBar('تم تسجيل الدليفري مان', isError: false);
    } else {
      controller.isLoading = false;
      debugPrint('❌فشل التسجيل تاكد من ملئ جميع الخانات ');
      showCustomSnackBar('❌فشل التسجيل تاكد من ملئ جميع الخانات ',
          isError: true);
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
          text: MainAppConstants.pleasefillForm,
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
                title: MainAppConstants.SelectVechileType,
                titleChoiceOne: MainAppConstants.motorcycle,
                titleChoiceTwo: MainAppConstants.vechile,
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
                title: MainAppConstants.selectLicenseType,
                titleChoiceOne: MainAppConstants.passport,
                titleChoiceTwo: MainAppConstants.drivingLicense,
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
                text: MainAppConstants.idNumber,
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
              buildRowCOnditions(
                context,
                value: acceptConditions,
                onChanged: (value) {
                  setState(() {
                    acceptConditions = value ?? false;
                  });
                },
              ),
              context.read<DriverRegisterController>().isLoading == true
                  ? GreenLoadingCircle()
                  : ApplyButton(
                      onTap: () => _register(context),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
