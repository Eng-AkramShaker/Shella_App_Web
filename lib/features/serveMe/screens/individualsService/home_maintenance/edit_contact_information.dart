import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';

class EditContactInformation extends StatelessWidget {
  const EditContactInformation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return AlertDialog(
        insetPadding: EdgeInsets.zero,
        backgroundColor: AppColors.backgroundColor,
        content: SizedBox(
          height: 510,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(child: Custom_Text(context, text: "معلومات التواصل", style: font13Green500W(context, size: size_12(context)))),
              _customtext(context, "اسم الشارع", "اسم الشارع"),
              SizedBox(height: 10),
              _customtext(context, "اسم المنطقة", "اسم المنطقة"),
              SizedBox(height: 10),
              Center(child: Custom_Text(context, text: "وضح عنوانك", style: font13Green500W(context, size: size_12(context)))),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: CustomTextField(
                    labelText: "المنزل",
                    borderColor: AppColors.gryColor_3,
                  )),
                  SizedBox(width: 20),
                  Expanded(
                      child: CustomTextField(
                    labelText: "ارضية ",
                    borderColor: AppColors.gryColor_3,
                  ))
                ],
              ),
              SizedBox(height: 10),
              _customtext(context, "الاسم الشخصي", "الاسم الشخصي"),
              SizedBox(height: 10),
              Custom_Text(context, text: "رقم التواصل", style: font11Black500W(context, size: size_14(context))),
              SizedBox(height: 5),
              CustomPhoneInput(
                controller: phoneController,
                onChanged: (p0) {},
              ),
            ],
          ),
        ));
  }

  Widget _customtext(BuildContext context, String title, String labelText) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Custom_Text(context, text: title, style: font10Black400W(context, size: size_14(context))),
        SizedBox(height: 5),
        CustomTextField(
          labelText: labelText,
          borderColor: AppColors.gryColor_3,
        )
      ],
    );
  }
}
