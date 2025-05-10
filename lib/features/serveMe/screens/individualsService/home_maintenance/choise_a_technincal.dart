import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/features/serveMe/widgets/greenAppBar.dart';
import 'package:shella_design/features/serveMe/widgets/technincal_card.dart';

class ChoiseATechnincal extends StatelessWidget {
  const ChoiseATechnincal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: greenAppBar(
        context,
        "خدمة تخدمني",
      ),
      body: Column(
        children: [
          custom_Images_asset(
            image: 'assets/images/FRAME (10) 1.png',
            h: 300,
            w: double.infinity,
            fit: BoxFit.fill,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 0.h),
              itemCount: 10,
              itemBuilder: (BuildContext context, int index) {
                return TechnincalCard();
              },
            ),
          )
        ],
      ),
    );
  }
}
