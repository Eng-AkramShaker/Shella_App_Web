import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';

class JobSpecification extends StatelessWidget {
  const JobSpecification({super.key});

  @override
  Widget build(BuildContext context) {
    final kaidhaFormController = Provider.of<KaidhaSubscription_Controller>(context, listen: false);

    return Column(
      children: [
        _buildRadioOption(
          context: context,
          icon: Icons.business,
          mainlabel: "موظف حكومي",
          seclabel: "موظف في القطاع الحكومي",
          value: "government employee",
          groupValue: kaidhaFormController.jobSpecification,
          onChanged: (value) {
            // kaidhaFormController.updatejobSpecification(value!);
          },
        ),
        SizedBox(height: 20),
        _buildRadioOption(
          context: context,
          icon: Icons.shopping_bag_outlined,
          mainlabel: "موظف قطاع خاص",
          seclabel: "موظف في شركة خاصة",
          value: "private sector employee",
          groupValue: kaidhaFormController.jobSpecification,
          onChanged: (value) {
            // kaidhaFormController.updatejobSpecification(value!);
          },
        ),
        SizedBox(height: 20),
        _buildRadioOption(
          context: context,
          icon: Icons.home_outlined,
          mainlabel: "صاحب عمل حر",
          seclabel: "لديك مشروع خاص او عمل حر",
          value: "self-employed",
          groupValue: kaidhaFormController.jobSpecification,
          onChanged: (value) {
            // kaidhaFormController.updatejobSpecification(value!);
          },
        ),
        SizedBox(height: 20),
        _buildRadioOption(
          context: context,
          icon: Icons.account_circle_outlined,
          mainlabel: "متقاعد",
          seclabel: "متقاعد عن العمل",
          value: "retired",
          groupValue: kaidhaFormController.jobSpecification,
          onChanged: (value) {
            // kaidhaFormController.updatejobSpecification(value!);
          },
        ),
      ],
    );
  }

  Widget _buildRadioOption({
    required BuildContext context,
    required IconData icon,
    required String mainlabel,
    required String seclabel,
    required String value,
    required String? groupValue,
    required Function(String?) onChanged,
  }) {
    return Container(
      height: 75,
      decoration: BoxDecoration(border: Border.all(color: AppColors.gryColor_3), borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.only(right: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipOval(
                child: Container(
              height: 48,
              width: 48,
              color: AppColors.greenColor,
              child: Icon(
                icon,
                size: 24,
                color: AppColors.backgroundColor,
              ),
            )),
            Spacer(flex: 1),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mainlabel,
                  textAlign: TextAlign.center,
                  style: font14Black500W(context),
                ),
                Text(
                  seclabel,
                  textAlign: TextAlign.center,
                  style: font14Black500W(context),
                ),
              ],
            ),
            Spacer(flex: 4),
            RadioTheme(
              data: RadioThemeData(
                fillColor: WidgetStateProperty.resolveWith<Color>((states) {
                  if (states.contains(WidgetState.selected)) {
                    return AppColors.greenColor;
                  }
                  return AppColors.gryColor_3;
                }),
              ),
              child: Radio<String>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
