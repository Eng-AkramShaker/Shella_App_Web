// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';

import 'package:shella_design/features/settings/controllers/custome_info_controller.dart';
import 'package:shella_design/features/settings/widgets/profile_buttons.dart';

import '../../../common/helper/app_routes.dart';

class UpdateProfileInfoPage extends StatefulWidget {
  const UpdateProfileInfoPage({super.key});

  @override
  State<UpdateProfileInfoPage> createState() => _UpdateProfileInfoPageState();
}

class _UpdateProfileInfoPageState extends State<UpdateProfileInfoPage> {
  late TextEditingController _fullNameController;
  late TextEditingController _phoneController;
  late TextEditingController _birthDateController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    final user = Provider.of<ProfileController>(context, listen: false).user;
    _fullNameController = TextEditingController(text: user?.fullName ?? '');
    _phoneController = TextEditingController(text: user?.phone ?? '');
    _birthDateController = TextEditingController(text: "01/01/2000");
    _emailController = TextEditingController(text: user?.email ?? '');
    _passwordController = TextEditingController(text: "********");

    _fullNameController.addListener(_checkForChanges);
    _phoneController.addListener(_checkForChanges);
    _emailController.addListener(_checkForChanges);
  }

  void _checkForChanges() {
    final user = Provider.of<ProfileController>(context, listen: false).user;

    final hasTextChanges = _fullNameController.text != (user?.fullName ?? '') ||
        _phoneController.text != (user?.phone ?? '') ||
        _emailController.text != (user?.email ?? '');

    setState(() {
      _hasChanges = hasTextChanges;
    });
  }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _birthDateController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.greenColor,
        // iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'تحديث الملف الشخصي',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: Column(
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundColor: AppColors.wGreyColor,
              child: Icon(
                Icons.person,
                size: 50.r,
                color: AppColors.wtColor,
              ),
            ),

            SizedBox(height: 30.h),

            _buildTextField(_fullNameController, 'الاسم الكامل', Icons.person),
            SizedBox(height: 20.h),
            _buildTextField(_phoneController, 'رقم الهاتف', Icons.phone),
            SizedBox(height: 20.h),

            _buildTextField(_emailController, 'البريد الالكتروني', Icons.email),
            SizedBox(height: 20.h),

            GestureDetector(
              onTap: () {
                nav.push(AppRoutes.confirmPasswordScreen);
              },
              child: _buildTextField(_passwordController, 'كلمة المرور', Icons.password, enabled: false),
            ),
            SizedBox(height: 40.h),

            // Save button
            Consumer<ProfileController>(
              builder: (context, controller, _) {
                return ProfileButton(
                  title: "حفظ التغييرات",
                  isLoading: controller.isLoading,
                  onTap: () => _saveChange(context, controller),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label, IconData icon, {bool enabled = true}) {
    return TextFormField(
      enabled: enabled,
      controller: controller,
      validator: (value) {
        if (label.contains('البريد') && value!.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      cursorColor: AppColors.greenColor,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(
          fontSize: 16.sp,
          color: AppColors.wGreyColor,
        ),
        prefixIcon: Icon(icon, color: AppColors.greenColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.wGreyColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.wGreyColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: AppColors.greenColor),
        ),
      ),
    );
  }

  void _saveChange(
    BuildContext context,
    ProfileController controller,
  ) async {
    if (!_hasChanges) {
      Navigator.pop(context);
      return;
    }

    final navigator = Navigator.of(context);
    final messenger = ScaffoldMessenger.of(context);
    if (_emailController.text.isEmpty) {
      messenger.showSnackBar(
        SnackBar(
          content: Text('البريد الإلكتروني مطلوب'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final updateData = {
      'full_name': _fullNameController.text,
      'phone': _phoneController.text,
      'email': _emailController.text,
    };
    try {
      final success = await controller.updateProfileInfo(updateData);

      navigator.pop();

      if (success) {
        navigator.pop();
        Provider.of<ProfileController>(context, listen: false).fetchUserData();
      } else {
        messenger.showSnackBar(
          SnackBar(
            content: Text('فشل في تحديث البيانات'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      // Close loading dialog
      navigator.pop();

      messenger.showSnackBar(
        SnackBar(
          content: Text('حدث خطأ: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }

    // await controller.updateProfileInfo(updateData);
    //
    // controller.updateProfileInfo(updateData).then((_) {
    //   navigator.pop(); // Go back to profile info page
    // });
  }
}
