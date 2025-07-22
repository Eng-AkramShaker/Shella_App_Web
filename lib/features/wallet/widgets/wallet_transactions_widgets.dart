import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import '../../../common/util/app_styles.dart';

class WalletTransactionsWidgets extends StatefulWidget {
  const WalletTransactionsWidgets({super.key});

  @override
  State<WalletTransactionsWidgets> createState() => _WalletTransactionsWidgetsState();
}

class _WalletTransactionsWidgetsState extends State<WalletTransactionsWidgets> {
  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      // Center the content on the screen
      child: Container(
        // Main container with margin and background color
        decoration: BoxDecoration(
          color: AppColors.wtColor,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5), // Shadow color
              spreadRadius: 0, // Spread radius
              blurRadius: 5, // Blur radius
              offset: Offset(0, 3), // Offset from the container
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
          children: <Widget>[
            Padding(
              // Padding for the title
              padding: const EdgeInsets.all(16.0),
              child: Text('المعاملات', style: font14Black500W(context)),
            ),
            // Buttons Row
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(children: List.generate(tr.length, (int index) => buildButton(tr[index], index))),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: AppColors.gryColor_5,
            ),
            // Image and Text
            Padding(
              padding: const EdgeInsets.all(100.0),
              child: Column(
                children: [
                  Center(
                    child: Image.asset(
                      // Replace with your image path
                      'assets/images/wallatT.jpg',
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'لا يوجد حالياً أي تسجيلات',
                    style: font12Grey400W(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildButton(String text, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2.5),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8), // Rounded corners for buttons
            border: Border.all(color: _selectedIndex == index ? AppColors.primaryColor : Colors.grey[300]!), // Add border
          ),
          padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 5.w),
          child: Center(
            child: Text(text),
          ),
        ),
      ),
    );
  }
}

List<String> tr = [
  'الكل',
  'طلبات',
  'الاسترداد',
  'تعويضات',
];
