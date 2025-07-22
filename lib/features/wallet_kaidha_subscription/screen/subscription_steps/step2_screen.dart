// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously, camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/custom_button.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/widget/file_upload_widget.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/widget/job_specification.dart';

class Step_2_Screen extends StatefulWidget {
  const Step_2_Screen({super.key});

  @override
  State<Step_2_Screen> createState() => _Step_2_ScreenState();
}

class _Step_2_ScreenState extends State<Step_2_Screen> {
  int? selectedDay;
  @override
  Widget build(BuildContext context) {
    return Consumer<KaidhaSubscription_Controller>(builder: (context, KaidhaSubController, _) {
      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: KaidhaSubController.isLoading_OTP == false
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "مصدر الدخل",
                      textAlign: TextAlign.center,
                      style: font13Black400W(context),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "اختر مصدر الدخل الرئيسي",
                      textAlign: TextAlign.center,
                      style: font13Black400W(context),
                    ),
                  ),
                  SizedBox(height: 20),
                  JobSpecification(),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "ما هو يوم استلام راتبك ؟",
                      textAlign: TextAlign.center,
                      style: font13Black400W(context),
                    ),
                  ),
                  SizedBox(height: 5),
                  Focus(
                    focusNode: KaidhaSubController.salaryDayFocus,
                    child: DropdownButtonFormField<int>(
                      decoration: InputDecoration(
                        hintText: 'اختر اليوم',
                        hintStyle: TextStyle(color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: KaidhaSubController.isSalaryDayEmpty ? Colors.red : AppColors.gryColor_3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: KaidhaSubController.isSalaryDayEmpty ? Colors.red : AppColors.greenColor,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      value: selectedDay,
                      onChanged: (int? newDay) {
                        setState(() {
                          selectedDay = newDay;
                          KaidhaSubController.salary_day.text = newDay.toString();
                          KaidhaSubController.isSalaryDayEmpty = false;
                        });
                      },
                      items: List.generate(31, (index) {
                        int day = index + 1;
                        return DropdownMenuItem(
                          value: day,
                          child: Text('$day'),
                        );
                      }),
                      validator: (value) {
                        if (value == null) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            setState(() {
                              KaidhaSubController.isSalaryDayEmpty = true;
                            });
                            if (!KaidhaSubController.salaryDayFocus.hasFocus) {
                              KaidhaSubController.salaryDayFocus.requestFocus();
                              Scrollable.ensureVisible(
                                KaidhaSubController.salaryDayFocus.context!,
                                duration: Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              );
                            }
                          });

                          return 'مطلوب اختيار اليوم';
                        }

                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "الدخل الشهري",
                      textAlign: TextAlign.center,
                      style: font13Black400W(context),
                    ),
                  ),
                  SizedBox(height: 5),
                  Focus(
                    focusNode: KaidhaSubController.monthlyIncomeFocus,
                    child: TextFormField(
                      key: KaidhaSubController.monthlyIncomeKey,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      cursorColor: AppColors.bgColor,
                      controller: KaidhaSubController.monthlyIncome,
                      onChanged: (value) {
                        if (value.isNotEmpty && KaidhaSubController.isMonthlyIncomeEmpty) {
                          setState(() {
                            KaidhaSubController.isMonthlyIncomeEmpty = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "ادخل الدخل الشهري تقريبًا",
                        hintStyle: font10Grey500W(context, size: size_14(context)),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: KaidhaSubController.isMonthlyIncomeEmpty ? Colors.red : AppColors.gryColor_3,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: KaidhaSubController.isMonthlyIncomeEmpty ? Colors.red : AppColors.greenColor,
                          ),
                        ),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "رمز QR",
                      textAlign: TextAlign.center,
                      style: font13Black400W(context),
                    ),
                  ),
                  SizedBox(height: 5),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.bgColor,
                    controller: KaidhaSubController.qr,
                    decoration: InputDecoration(
                      hintText: "Qr  12325",
                      hintStyle: font10Grey500W(context, size: size_14(context)),
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.gryColor_3),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: AppColors.greenColor),
                      ),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.topRight,
                    child: Text(
                      "ارفاق المستندات",
                      textAlign: TextAlign.center,
                      style: font13Black400W(context),
                    ),
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "أرفق صورًا واضحة لمستنداتك مثل الهوية أو عقد الإيجار، واسمِّ كل ملف قبل رفعه.",
                      textAlign: TextAlign.right,
                      style: font13Black400W(context),
                    ),
                  ),
                  SizedBox(height: 20),
                  FileUploadWithNameWidget(),
                  SizedBox(height: 20),
                  Container(
                    width: 1170,
                    padding: EdgeInsets.all(size_15(context)),
                    child: CustomButton(
                      isLoading: false,
                      buttonText: "التالي",
                      onPressed: () async {
                        KaidhaSubController.validate_Fields_Screen_2(context, KaidhaSubController.identity_card_number.text);
                      },
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
