// ignore_for_file: non_constant_identifier_names, avoid_print, use_build_context_synchronously, camel_case_types, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/custom_button.dart';
import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/features/settings/controllers/custome_info_controller.dart';
import 'package:shella_design/features/settings/controllers/profile_detailes_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/widget/before_Pdf.dart';
import 'package:intl/intl.dart';

class Step_3_Screen extends StatefulWidget {
  const Step_3_Screen({super.key});

  @override
  State<Step_3_Screen> createState() => _Step_3_ScreenState();
}

class _Step_3_ScreenState extends State<Step_3_Screen> {
  bool isExpanded = false;

  String timeNow = "";
  String dayNow = "";

  @override
  void initState() {
    super.initState();
    _initS();
  }

  Future<void> _initS() async {
    await initializeDateFormatting('ar', null);

    timeNow = getCurrentTime();
    dayNow = getCurrentDay();
  }

  String getCurrentTime() {
    final now = DateTime.now();
    final hour = now.hour;
    final minute = now.minute.toString().padLeft(2, '0');

    // صيغة 12 ساعة:
    final hour12 = hour % 12 == 0 ? 12 : hour % 12;

    // تحديد صباحاً أو مساءً:
    final period = hour < 12 ? "صباحاً" : "مساءً";

    return "$hour12:$minute $period";
  }

  String getCurrentDay() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE', 'ar');
    return formatter.format(now);
  }

  @override
  Widget build(BuildContext context) {
    // AddressModel? address = AddressHelper.getUserAddressFromSharedPref();

    TextStyle headerStyle = TextStyle(fontSize: 15, fontWeight: FontWeight.bold);
    TextStyle bulletStyle = TextStyle(fontSize: 13, height: 1.8);
    TextStyle normalStyle = TextStyle(fontSize: 13, height: 1.6);

    //

    return Consumer3<KaidhaSubscription_Controller, ProfileController, CustomerController>(
      builder: (context, KaidhaSubController, profController, customerController, _) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: KaidhaSubController.isLoading_Status
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //
                      KaidhaSubController.isShow == false
                          ? Card(
                              color: AppColors.gryColor_6,
                              child: SizedBox(
                                height: 200,
                                width: 350,
                                child: KaidhaSubController.nafath_national_id == null ||
                                        KaidhaSubController.nafath_national_id!.externalResponse == null ||
                                        KaidhaSubController.nafath_national_id!.externalResponse!.isEmpty ||
                                        KaidhaSubController.nafath_national_id!.externalResponse![0].random == null ||
                                        KaidhaSubController.nafath_national_id!.externalResponse![0].random == "null"
                                    ? const Center(child: CircularProgressIndicator())
                                    : Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 80,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(color: AppColors.greenColor, width: 3),
                                            ),
                                            child: Text(
                                              KaidhaSubController.nafath_national_id!.externalResponse![0].random.toString(),
                                              style: font18Green500W(context),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                          const SizedBox(height: 20),
                                          Text(
                                            ' قم بأدخال هذا الكود الي تطبيق نفاذ',
                                            style: font14Black400W(context),
                                          ),
                                        ],
                                      ),
                              ),
                            )
                          : SizedBox(height: 100),

                      SizedBox(height: 30),

                      if (KaidhaSubController.isShow == false)
                        GestureDetector(
                          onTap: () => setState(() => isExpanded = !isExpanded),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: RichText(
                              text: TextSpan(
                                style: normalStyle.copyWith(color: Colors.black),
                                children: isExpanded
                                    ? [
                                        TextSpan(text: 'أهلاً بك في عائلة قيدها، ونهنئك على وصولك للخطوة النهائية في رحلة انضمامك!\n'),
                                        TextSpan(
                                            text: 'يسعدنا خدمتك في هذه المرحلة الحاسمة، وهي توثيق العقد الرسمي عبر منصة "نفاذ".\n'),
                                        TextSpan(text: 'لتسهيل الأمر عليك، أمامك الآن خياران لإتمام العملية:\n\n'),
                                        TextSpan(text: '1. الخيار الأول (موصى به): مراجعة العقد ثم التوثيق\n', style: headerStyle),
                                        TextSpan(
                                            text:
                                                'إذا كنت ترغب في الاطلاع على كافة تفاصيل وبنود العقد قبل أي التزام قانوني، يرجى اتباع الخطوات التالية:\n',
                                            style: normalStyle),
                                        TextSpan(
                                            text: '• أولاً: اضغط على أيقونة "الاطلاع على العقد" لمراجعته بعناية.\n',
                                            style: bulletStyle),
                                        TextSpan(
                                            text: '• ثانياً: بعد الانتهاء من المراجعة، اتبع خطوات التوثيق التالية:\n',
                                            style: bulletStyle),
                                        TextSpan(text: '   ◦ أ. اضغط على زر "التوثيق".\n', style: bulletStyle),
                                        TextSpan(text: '   ◦ ب. سيظهر أمامك الآن رقم محدد للعملية، يرجى تذكره.\n', style: bulletStyle),
                                        TextSpan(
                                            text: '   ◦ ج. افتح تطبيق "نفاذ" في هاتفك، واختر الطلب الذي يحمل نفس الرقم.\n',
                                            style: bulletStyle),
                                        TextSpan(text: '   ◦ د. أكمل إجراءات الموافقة لإتمام المصادقة بنجاح.\n\n', style: bulletStyle),
                                        TextSpan(text: '2. الخيار الثاني: التوثيق المباشر\n', style: headerStyle),
                                        TextSpan(
                                            text: 'في حال كنت قد اطلعت على الشروط مسبقاً وتثق بها، يمكنك البدء بالتوثيق المباشر:\n',
                                            style: normalStyle),
                                        TextSpan(text: '• أ. اضغط على زر "التوثيق المباشر".\n', style: bulletStyle),
                                        TextSpan(text: '• ب. سيظهر أمامك رقم محدد للعملية.\n', style: bulletStyle),
                                        TextSpan(
                                            text: '• ج. افتح تطبيق "نفاذ" في هاتفك واختر الطلب الذي يحمل نفس الرقم.\n',
                                            style: bulletStyle),
                                        TextSpan(text: '• د. وافق على الطلب لإتمام المصادقة.\n', style: bulletStyle),
                                        TextSpan(
                                          text: '\nإخفاء',
                                          style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
                                        ),
                                      ]
                                    : [
                                        TextSpan(text: 'أهلاً بك في عائلة قيدها، ونهنئك على وصولك للخطوة النهائية في رحلة انضمامك!\n'),
                                        TextSpan(
                                            text: 'يسعدنا خدمتك في هذه المرحلة الحاسمة، وهي توثيق العقد الرسمي عبر منصة "نفاذ".\n'),
                                        TextSpan(
                                          text: '..... عرض المزيد',
                                          style: TextStyle(color: AppColors.primaryColor, fontSize: 15),
                                        ),
                                      ],
                              ),
                            ),
                          ),
                        ),
                      Column(
                        children: [
                          SizedBox(height: 10),

                          Container(
                            width: 1170,
                            padding: EdgeInsets.all(size_15(context)),
                            child: CustomButton(
                              isLoading: false,
                              color: AppColors.primaryColor,
                              buttonText: "استعراض العقد قبل التوقيع ",
                              onPressed: () async {
                                //
                                // KaidhaSubController.update_isShow();

                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Befor_Pdf_Screen(
                                      time: timeNow,
                                      day: dayNow,
                                      name:
                                          "${KaidhaSubController.firstname.text} ${KaidhaSubController.fathername.text} ${KaidhaSubController.grandfathername.text} ${KaidhaSubController.last_name.text}",
                                      identityNumber: KaidhaSubController.identity_card_number.text.toString(),
                                      nationality: KaidhaSubController.nationality.toString(),
                                      neighborhood: KaidhaSubController.neighborhood.text.toString(),
                                      house_type: KaidhaSubController.house_type.toString(),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),

                          //
                          //

                          if (KaidhaSubController.isShow == false)
                            Container(
                              width: 1170,
                              padding: EdgeInsets.all(size_15(context)),
                              child: CustomButton(
                                isLoading: false,
                                color: AppColors.orangeColor,
                                buttonText: "التحقق من المصادقة",
                                onPressed: () async {
                                  //

                                  await KaidhaSubController.onChange_dialog(context, KaidhaSubController.identity_card_number.text);
                                },
                              ),
                            ),

                          //

                          Container(
                            width: 1170,
                            padding: EdgeInsets.all(size_15(context)),
                            child: CustomButton(
                              isLoading: false,
                              buttonText: "توقيع العقد ولإرسال البيانات",
                              onPressed: () async {
                                //

                                await KaidhaSubController.Nafath_send_All_Data(
                                  context,
                                  KaidhaSubController.identity_card_number.text,
                                  KaidhaSubController.nationality.toString(),
                                  KaidhaSubController.neighborhood.text,
                                  KaidhaSubController.house_type,
                                ).then(
                                  (onValue) async {
                                    //

                                    // debugPrint("\x1B[32m  Nafath_send_All_Data   $onValue  \x1B[0m");
                                    //
                                    //       if (onValue.statusCode == 200 || onValue.statusCode == 201) {
                                    //         await KaidhaSubController.Submit_Store_Info(
                                    //             context, profController.address![0].address, customerController.customer!.phone!);
                                    //       } else if (onValue.statusCode == 404) {
                                    //         //
                                    //
                                    //   KaidhaSubController.update_isShow();
                                    //
                                    //   showCustomSnackBar(context, "اعد المحاوله مره اخري في وقت لاحق");
                                    // }
                                  },
                                );
                              },
                            ),
                          )

                          //
                        ],
                      ),

                      SizedBox(height: 70),
                    ],
                  ),
          ),
        );
      },
    );
  }
}
