import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FavoriteErrorView extends StatelessWidget {
  final String errorMessage;
  final bool isRetrying;
  final VoidCallback onRetry;
  final VoidCallback onRelogin;

  const FavoriteErrorView({
    super.key,
    required this.errorMessage,
    required this.isRetrying,
    required this.onRetry,
    required this.onRelogin,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            errorMessage,
            style: TextStyle(fontSize: 16.sp, color: Colors.red),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20.h),
          ElevatedButton(
            onPressed: isRetrying ? null : onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              disabledBackgroundColor: Colors.grey,
            ),
            child: isRetrying
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ))
                : const Text('إعادة المحاولة'),
          ),
          SizedBox(height: 10.h),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login').then((_) {
                onRelogin();
              });
            },
            child: const Text(
              'إعادة تسجيل الدخول',
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
