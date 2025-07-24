import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/Api_constants.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/settings/controllers/custome_info_controller.dart';

import '../widgets/mobile/build_mobile_profile/build_textfield.dart';
import '../widgets/mobile/profile_buttons.dart';

class UpdateProfileInfoPage extends StatefulWidget {
  const UpdateProfileInfoPage({super.key});

  @override
  State<UpdateProfileInfoPage> createState() => _UpdateProfileInfoPageState();
}

class _UpdateProfileInfoPageState extends State<UpdateProfileInfoPage> {
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    final controller = context.read<CustomerController>();
    final customer = controller.customer;
    _fullNameController = TextEditingController(text: customer?.fullName ?? '');
    _phoneController = TextEditingController(text: customer?.phone ?? '');
    _emailController = TextEditingController(text: customer?.email ?? '');
    _passwordController = TextEditingController(text: "********");

    /// Add Listeners
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _fullNameController.addListener(_updateControllerChanges);
      _phoneController.addListener(_updateControllerChanges);
      _emailController.addListener(_updateControllerChanges);
      _updateControllerChanges();
    });
  }

  void _updateControllerChanges() {
    context.read<CustomerController>().checkForChanges(
      _fullNameController.text,
      _phoneController.text,
      _emailController.text,
    );
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CustomerController>();
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
          backgroundColor: AppColors.greenColor,
          title: Text('تحديث الملف الشخصي',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold)),
          centerTitle: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.showImagePickerBottomSheet(context);
              },
              child: Consumer<CustomerController>(
                builder: (context, controller, _) {
                  final customer = controller.customer;
                  return CircleAvatar(
                    radius: 60.r,
                    backgroundColor: AppColors.wGreyColor,
                    backgroundImage: controller.pickedImage != null
                        ? FileImage(File(controller.pickedImage!.path))
                        : (customer?.image != null &&
                        !controller.isImageRemoved)
                        ? NetworkImage(
                        '${ApiConstants.appBaseUrl}/storage/profile/${customer!.image}')
                    as ImageProvider
                        : null,
                    child: controller.pickedImage == null &&
                        (customer?.image == null ||
                            controller.isImageRemoved)
                        ? Icon(Icons.person,
                        size: 50.r, color: AppColors.wtColor)
                        : null,
                  );
                },
              ),
            ),
            SizedBox(height: 30.h),
            buildTextField(_fullNameController, 'الاسم الكامل', Icons.person),
            SizedBox(height: 20.h),
            buildTextField(_phoneController, 'رقم الهاتف', Icons.phone),
            SizedBox(height: 20.h),
            buildTextField(_emailController, 'البريد الالكتروني', Icons.email),
            SizedBox(height: 20.h),
            GestureDetector(
                onTap: () {
                  nav.push( AppRoutes.confirmPasswordScreen);
                },
                child: buildTextField(
                    _passwordController, 'كلمة المرور', Icons.password,
                    enabled: false)),
            SizedBox(height: 40.h),
            ProfileButton(
                title: "حفظ التغييرات",
                isLoading: controller.isLoading,
                onTap: () => controller.saveProfileChanges(context, {
                  'full_name': _fullNameController.text,
                  'phone': _phoneController.text,
                  'email': _emailController.text,
                }))
          ],
        ),
      ),
    );
  }
}