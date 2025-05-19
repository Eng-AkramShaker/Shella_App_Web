
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotLoggedInView extends StatelessWidget {
  final VoidCallback onLoginComplete;

  const NotLoggedInView({
    super.key,
    required this.onLoginComplete,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "يجب تسجيل الدخول لعرض المفضلة",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 15.h),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login').then((_) {
                onLoginComplete();
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.h),
            ),
            child: const Text(
              "تسجيل الدخول",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
