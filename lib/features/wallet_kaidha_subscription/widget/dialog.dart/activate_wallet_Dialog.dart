// ignore_for_file: file_names, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/custom_button.dart';

Widget buildWalletDialogContent(context) {
  return Center(
    child: Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: Image.asset(AppImages.activate_wallet, height: 70, width: 70)),
          const SizedBox(height: 20),
          Text("في انتظار تفعيل محفظة قيدها", style: font18Black400W(context)),
          const SizedBox(height: 7),
          Text('يمكنك الآن متابعة رصيدك وإجراء المعاملات بسهولة.', style: font10Black400W(context)),
          const SizedBox(height: 30),
          Container(
            width: 200,
            padding: EdgeInsets.all(size_12(context)),
            child: CustomButton(
              isLoading: false,
              buttonText: "تم",
              onPressed: () async {
                // Get.offAllNamed(RouteHelper.getMainRoute("menu"));
              },
            ),
          ),
        ],
      ),
    ),
  );
}
