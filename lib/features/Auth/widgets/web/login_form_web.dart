// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/features/Auth/widgets/web/login_action_buttons_row_web.dart';
import 'package:shella_design/features/Auth/widgets/web/login_header_row_web.dart';
import 'package:shella_design/features/Auth/widgets/web/phone_number_field_web.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneCtr = TextEditingController();

  @override
  void dispose() {
    _phoneCtr.dispose();
    super.dispose();
  }

  void _sendCode() {
    if (_formKey.currentState!.validate()) {
      print('Sending code to ${_phoneCtr.text}');

      nav.pushAndRemoveUnti(AppRoutes.webHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: AppColors.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 750),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LoginHeaderRow(title: 'تسجيل الدخول', onBack: () => Navigator.of(context).pop()),
              Divider(height: 1.h, color: Colors.grey.shade300),
              const SizedBox(height: 8),
              Text(
                'الرجاء إدخال الرقم الخلوي لإكمال تسجيل الدخول',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              Form(
                key: _formKey,
                child: PhoneNumberField(
                  controller: _phoneCtr,
                  validator: (v) {
                    final t = v?.trim() ?? '';
                    if (t.isEmpty) return 'الرجاء إدخال رقم الهاتف';
                    if (!RegExp(r'^[0-9]{7,15}$').hasMatch(t)) {
                      return 'يجب أن يحتوي رقم الهاتف على ٧ إلى ١٥ رقماً';
                    }
                    return null;
                  },
                  showHelper: false,
                ),
              ),
              const SizedBox(height: 24),
              LoginActionButtonsRow(onClose: () => Navigator.of(context).pop(), onSend: _sendCode),
            ],
          ),
        ),
      ),
    );
  }
}
