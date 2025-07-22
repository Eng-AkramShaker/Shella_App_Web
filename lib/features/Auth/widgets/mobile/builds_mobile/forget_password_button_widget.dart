import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/Auth/controllers/auth_controller.dart'; // Ensure AuthState is accessible

/// A reusable button widget for the Forget Password screen.
/// It displays a loading indicator or an arrow icon based on the AuthController's state.
class ForgetPasswordActionButton extends StatelessWidget {
  /// The instance of AuthController to observe its state (e.g., loading).
  final AuthController authController;

  /// The callback function to execute when the button is pressed.
  /// This function should contain the logic for handling the forget password request.
  final void Function()? onPressed;
  final Widget child;

  const ForgetPasswordActionButton({
    super.key,
    required this.authController,
    required this.child,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    // The ElevatedButton's UI and its loading state logic are encapsulated here.
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.greenColor,
        minimumSize: Size(60.w, 60.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.r),
        ),
      ),
      // If the authentication state is loading, the button is disabled (onPressed is null).
      // Otherwise, the provided onPressed callback is executed.
      onPressed: onPressed,
      child: child,
    );
  }
}
