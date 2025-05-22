import 'package:flutter/material.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class BalanceErrorDialog extends StatelessWidget {
  final String message;
  final VoidCallback onDone;

  const BalanceErrorDialog({
    super.key,
    required this.message,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        child: Container(
          width: 450,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, right: 8.0),
                    child: IconButton(
                      icon: const Icon(
                        Icons.close,
                        color: Colors.grey,
                      ),
                      onPressed: onDone,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: const Color(0xFFE53935).withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.close,
                  size: 50,
                  color: Color(0xFFE53935),
                ),
              ),
              const SizedBox(height: 24),
              Custom_Text(
                context,
                text: "فشلت العملية",
                style: font18Black700W(context),
              ),
              const SizedBox(height: 16),
              Custom_Text(
                context,
                text: message,
                style: font10Grey400W(context, size: 18),
              ),
              const SizedBox(height: 32),
              custom_Button(
                h: 50,
                w: double.infinity,
                context,
                title: "الرجاء المحاولة لاحقاً",
                style: font10White400W(context),
                buttoncolor: AppColors.primaryColor,
                onPressed: onDone,
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
