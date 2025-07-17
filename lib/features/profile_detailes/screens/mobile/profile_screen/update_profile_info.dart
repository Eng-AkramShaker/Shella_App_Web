import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/indian_app_constants.dart';

import 'package:shella_design/features/profile_detailes/controllers/custome_info_controller.dart';
import 'package:shella_design/features/profile_detailes/widgets/mobile/profile_buttons.dart';

import '../../../widgets/mobile/build_mobile_profile/build_textfield.dart';

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

  // XFile? _pickedImage;
  // bool _isImageRemoved = false;
  // bool _hasChanges = false;

  @override
  void initState() {
    super.initState();
    // final customer =
    //     Provider.of<CustomerController>(context, listen: false).customer;
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

  // void _checkForChanges() {
  //   final controller = Provider.of<CustomerController>(context, listen: false);
  //   final customer = controller.customer;
  //
  //   final hasTextChanges =
  //       _fullNameController.text != (customer?.fullName ?? '') ||
  //           _phoneController.text != (customer?.phone ?? '') ||
  //           _emailController.text != (customer?.email ?? '');
  //
  //   setState(() {
  //     _hasChanges = hasTextChanges || _pickedImage != null || _isImageRemoved;
  //   });
  // }

  @override
  void dispose() {
    _fullNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  // Future<void> _pickImage(ImageSource source) async {
  //   final picker = ImagePicker();
  //   final pickedImage = await picker.pickImage(source: source);
  //   if (pickedImage != null) {
  //     setState(() {
  //       _pickedImage = pickedImage;
  //       _isImageRemoved = false;
  //       _hasChanges = true;
  //     });
  //   }
  // }

  // void _removeImage() {
  //   setState(() {
  //     _pickedImage = null;
  //     _isImageRemoved = true;
  //     _hasChanges = true;
  //   });
  //   Navigator.pop(context);
  // }

  // void _showImagePickerBottomSheet() {
  //   final customer =
  //       Provider.of<CustomerController>(context, listen: false).customer;
  //   showModalBottomSheet(
  //     context: context,
  //     builder: (context) {
  //       return SafeArea(
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             if (customer?.image != null || _pickedImage != null) ...[
  //               ListTile(
  //                 leading: Icon(Icons.delete, color: Colors.red),
  //                 title: Text('حذف الصورة'),
  //                 onTap: _removeImage,
  //               ),
  //               Divider(),
  //             ],
  //             ListTile(
  //               leading: Icon(Icons.photo_library),
  //               title: Text('اختيار من المعرض'),
  //               onTap: () {
  //                 Navigator.pop(context);
  //                 _pickImage(ImageSource.gallery);
  //               },
  //             ),
  //             ListTile(
  //               leading: Icon(Icons.camera_alt),
  //               title: Text('فتح الكاميرا'),
  //               onTap: () {
  //                 Navigator.pop(context);
  //                 _pickImage(ImageSource.camera);
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<CustomerController>();
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
                                    '${AppConstants.baseUrl}/storage/profile/${customer!.image}')
                                as ImageProvider
                            : null,
                    child: controller.pickedImage == null &&
                            (customer?.image == null ||
                                controller.isImageRemoved)
                        ? Icon(
                            Icons.person,
                            size: 50.r,
                            color: AppColors.wtColor,
                          )
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
                pushNewScreen(context, AppRoutes.confirmPasswordScreen);
              },
              child: buildTextField(
                  _passwordController, 'كلمة المرور', Icons.password,
                  enabled: false),
            ),
            SizedBox(height: 40.h),
            // Consumer<CustomerController>(
            //   builder: (context, controller, _) {
            //     return ProfileButton(
            //       title: "حفظ التغييرات",
            //       isLoading: controller.isLoading,
            //       onTap: () => _saveChange(context, controller),
            //     );
            //   },
            // ),
            ProfileButton(
              title: "حفظ التغييرات",
              isLoading: controller.isLoading,
              onTap: () => controller.saveProfileChanges(
                context,
                {
                  'full_name': _fullNameController.text,
                  'phone': _phoneController.text,
                  'email': _emailController.text,
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
