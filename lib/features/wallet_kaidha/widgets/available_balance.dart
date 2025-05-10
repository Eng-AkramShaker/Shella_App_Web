import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/util/app_colors.dart';
import '../../../common/widgets/texts/custom_text.dart';
import '../../../util/app_styles.dart';

class PaymentOptions extends StatefulWidget {
  PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  late int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> list = [
      {
        'title': 'المبلغ المستحق بالكامل',
        'amount': 'SAR 2500 ',
      },
      {
        'title': 'المبلغ المستحق لكشف الحساب',
        'amount': 'SAR 23335 ',
      },
      {
        'title': 'المبلغ الأدنى المستحق',
        'amount': 'SAR 55555 ',
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Custom_Text(
              context,
              text: 'خيارات الدفع',
              style: font14Black500W(context),
            ),
            Column(
                children: List.generate(
                    list.length,
                    (int index) => Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              log(selectedIndex.toString());
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.r),
                                    border: Border.all(
                                      color: AppColors.gryColor_3,
                                      width: 1,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Custom_Text(
                                            context,
                                            text: list[index]['title'],
                                            style: font13Black400W(context),
                                          ),
                                          SizedBox(
                                            height: 5.h,
                                          ),
                                          Custom_Text(context,
                                              text: list[index]['amount'],
                                              style: font10Grey400W(context))
                                        ],
                                      ),
                                      Spacer(),
                                      Radio<int>(
                                        activeColor: AppColors.greenColor,
                                        value: index,
                                        onChanged: (value) {
                                          setState(() {
                                            selectedIndex = value ?? 0;
                                          });
                                        },
                                        groupValue: selectedIndex,
                                      )
                                    ],
                                  ),
                                )),
                          ),
                        ))),
          ],
        )
      ],
    );
  }
}
