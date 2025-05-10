import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';

class WebOrdersToggleButton extends StatefulWidget {
  const WebOrdersToggleButton({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WebOrdersToggleButtonState createState() => _WebOrdersToggleButtonState();
}

class _WebOrdersToggleButtonState extends State<WebOrdersToggleButton> {
  int _selectedIndex = 0;
  final List<String> _options = ['فوري', 'مجدول'];

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: AppColors.backgroundColor,
      margin: EdgeInsets.only(bottom: 20.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: List.generate(_options.length, (index) {
          bool isSelected = _selectedIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 30.w,
                vertical: 10,
              ),
              child: Column(
                children: [
                  Custom_Text(
                    context,
                    text: _options[index],
                    size: 18,
                  ),
                  SizedBox(height: 4.h),
                  if (isSelected)
                    Container(
                      width: 30.w,
                      height: 3.h,
                      color: Colors.green,
                    ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
