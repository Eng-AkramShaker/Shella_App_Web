import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/util/app_colors.dart';
import 'package:shella_design/util/app_dimensions.dart';
import 'package:shella_design/util/app_styles.dart';

class BookingDetails extends StatelessWidget {
  final String time;
  final String date;
  const BookingDetails({super.key, required this.time, required this.date});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        color: AppColors.backgroundColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(context,
                  text: "تفاصيل الحجز",
                  style: font11Black500W(context, size: size_16(context))),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: 80,
                    width: 140,
                    color: AppColors.gryColor_8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.watch_later_outlined,
                                size: 20,
                                color: AppColors.greenColor,
                              ),
                              Spacer(flex: 1),
                              Custom_Text(context,
                                  text: "الوقت",
                                  style: font10Black400W(context,
                                      size: size_12(context))),
                              Spacer(flex: 5),
                            ],
                          ),
                          Spacer(flex: 2),
                          Row(children: [
                            Spacer(flex: 3),
                            Custom_Text(context,
                                text: time,
                                style: font14Green500W(context,
                                    size: size_16(context))),
                            Spacer(flex: 1),
                          ]),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 80,
                    width: 140,
                    color: AppColors.gryColor_8,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.date_range_outlined,
                                size: 20,
                                color: AppColors.greenColor,
                              ),
                              Spacer(flex: 1),
                              Custom_Text(context,
                                  text: "التاريخ",
                                  style: font10Black400W(context,
                                      size: size_12(context))),
                              Spacer(flex: 5),
                            ],
                          ),
                          Spacer(flex: 2),
                          Row(children: [
                            Spacer(flex: 3),
                            Custom_Text(context,
                                text: date,
                                style: font14Green500W(context,
                                    size: size_16(context))),
                            Spacer(flex: 1),
                          ]),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
