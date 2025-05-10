import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/kaidha_form/controller/kaidha_form_controller.dart';
import 'package:shella_design/features/kaidha_form/widget/file_upload_widget.dart';
import 'package:shella_design/features/kaidha_form/widget/job_specification.dart';
import 'package:shella_design/features/kaidha_form/widget/monthly_salary_text_form_field.dart';
import 'package:shella_design/features/kaidha_form/widget/stages_widget.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_navigators.dart';
import 'package:shella_design/util/app_styles.dart';

class VerifySourceOfIncome extends StatefulWidget {
  const VerifySourceOfIncome({super.key});

  @override
  State<VerifySourceOfIncome> createState() => _VerifySourceOfIncomeState();
}

class _VerifySourceOfIncomeState extends State<VerifySourceOfIncome> {
  @override
  Widget build(BuildContext context) {
    final kaidhaFormController = Provider.of<KaidhaFormController>(context);
    kaidhaFormController.currentStage = 2;
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: customAppBar(context,
            style: font12White600W(context, size: size_14(context)),
            title: "التحقق من مصدر الدخل",
            icon: Icons.money, onPressed: () {
          popRoute(context);
        }),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(children: [
              StagesWidget(),
              SizedBox(height: 10),
              Custom_Text(context,
                  text: "مصدر الدخل",
                  style: font10Black600W(context, size: size_14(context))),
              SizedBox(height: 10),
              Custom_Text(context,
                  text: "اختر مصدر الدخل الرئيسي",
                  style: font10Grey500W(context, size: size_10(context))),
              SizedBox(height: 20),
              JobSpecification(),
              SizedBox(height: 20),
              Custom_Text(context,
                  text: "الدخل الشهري",
                  style: font11Black500W(context, size: size_14(context))),
              SizedBox(height: 5),
              MonthlySalary(kaidhaFormController: kaidhaFormController),
              SizedBox(height: 20),
              Custom_Text(context,
                  text: "ارفاق المستندات",
                  style: font11Black500W(context, size: size_14(context))),
              SizedBox(height: 10),
              FileUploadWidget(),
              SizedBox(height: 10),
              custom_Button(context,
                  title: "إرسال",
                  onPressed: () {},
                  h: 50,
                  style: font12White500W(context)),
              SizedBox(height: 40)
            ])));
  }
}
