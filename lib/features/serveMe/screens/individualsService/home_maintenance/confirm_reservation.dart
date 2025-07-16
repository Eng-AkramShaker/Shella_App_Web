import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/features/serveMe/controllers/serve_me_controller.dart';
import 'package:shella_design/features/serveMe/widgets/address.dart';
import 'package:shella_design/features/serveMe/widgets/booking_details.dart';
import 'package:shella_design/features/serveMe/widgets/comments.dart';
import 'package:shella_design/features/serveMe/widgets/fees.dart';
import 'package:shella_design/features/serveMe/widgets/payment_method.dart';
import 'package:shella_design/features/serveMe/widgets/service_evaluation.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ConfirmReservation extends StatefulWidget {
  const ConfirmReservation({super.key});

  @override
  State<ConfirmReservation> createState() => _ConfirmReservationState();
}

class _ConfirmReservationState extends State<ConfirmReservation> {
  @override
  Widget build(BuildContext context) {
    final serveMeController = Provider.of<ServeMeController>(context);
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: customAppBar(context, style: font12White600W(context, size: size_14(context)), title: "تاكيد الحجز", onPressed: () {
          nav.back();
        }),
        body: ListView(children: [
          ServiceEvaluation(
            evaluationdegree: 4.7,
            evaluationnum: 250,
            image: AppImages.Plumbingservices,
          ),
          BookingDetails(
            time: "9:00",
            date: "25 فبراير",
          ),
          Address(),
          PaymentMethod(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Comments(
              controller: serveMeController.comments,
              hintText: 'أضف ملاحظاتك',
            ),
          ),
          Fees(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10),
            child: custom_Button(context, h: 45, title: "تاكيد الحجز", style: font10White400W(context, size: size_14(context)),
                onPressed: () {
              nav.push(AppRoutes.bookingConfirmationSuccess);
            }),
          )
        ]));
  }
}
