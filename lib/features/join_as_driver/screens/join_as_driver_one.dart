import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/join_as_driver/controllers/join_as_driver_controller.dart';
import 'package:shella_design/features/join_as_driver/widgets/phone_and_email.dart';
import 'package:shella_design/features/join_as_driver/widgets/picture_and_full_name.dart';
import '../../../common/widgets/appBar/customAppBar.dart';

class JoinAsDriverOne extends StatefulWidget {
  const JoinAsDriverOne({super.key});

  @override
  _JoinAsDriverOneState createState() => _JoinAsDriverOneState();
}

class _JoinAsDriverOneState extends State<JoinAsDriverOne> {
  File? profilePicture;

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool showPass = true;

  Future<void> _selectPicture(BuildContext context) async {
    final picker = ImagePicker();
    final photo = await picker.pickImage(source: ImageSource.gallery);
    if (photo != null) {
      context.read<DriverRegisterController>().setProfilePicture(File(photo.path)); 
      setState(() {
        profilePicture = File(photo.path);
      });
    }
  }
  
Future<void> _registerDriver(BuildContext context) async {
  context.read<DriverRegisterController>().setFirstName(firstNameController.text);
  context.read<DriverRegisterController>().setLastName(lastNameController.text);
  context.read<DriverRegisterController>().setEmail(emailController.text);
  
  context.read<DriverRegisterController>().setPassword(passwordController.text);
  
  final controller = context.read<DriverRegisterController>();

  debugPrint('phone after phone picker: ${controller.phone}'); 

  if (controller.profilePicture == null ||
      controller.firstName.isEmpty ||
      controller.lastName.isEmpty ||
      controller.phone.isEmpty ||
      controller.email.isEmpty ||
      controller.password.isEmpty) {
    debugPrint('❌ بيانات غير مكتملة للتسجيل');
    return ;
  }
  
  bool success = await controller.registerDriver();

  if (success) {
    debugPrint('✅ تم تسجيل الدليفري مان');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('تم تسجيل الدليفري مان')),
    );
  } else {
    debugPrint('❌فشل التسجيل تاكد من ملئ جميع الخانات ');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('❌فشل التسجيل تاكد من ملئ جميع الخانات '),
    ));
  }
}
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: customAppBar(context, title:'انضم كرجل توصيل', img:'assets/images/join_as_driver_appbar_img.png'),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PictureAndFullName(
              profilePicture: profilePicture,
              onSelectPicture: () => _selectPicture(context),
              firstNameController: firstNameController,
              lastNameController: lastNameController,
            ),
            SizedBox(height: 20),
            PhoneAndEmail(
              phoneController: phoneController,
              emailController: emailController,
              passwordController: passwordController,
              confirmPasswordController: confirmPasswordController,
              showPass: showPass,
              onToggleVisible: () {
                setState(() {
                   showPass = !showPass;
                });
              },
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 55.h,
              decoration: BoxDecoration(color: AppColors.greenColor, borderRadius: BorderRadius.circular(8.r)),
              child: Custom_Text_Button(
                context,
                text_style: font14White500W(context),
                onPressed: () async {
                  await _registerDriver(context);
                  // pushNewScreen(context, AppRoutes.joinAsDriverTwo);
                },
                text:'التالي',
              )
            )
          ],
        )
      )
    );
  }
}




    