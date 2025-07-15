import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/appBar/customAppBar.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/widget/personal_information.dart';
import 'package:shella_design/features/wallet_kaidha/kaidha_form/widget/stages_widget.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';

class AliashtirakFiQaydiha extends StatefulWidget {
  const AliashtirakFiQaydiha({super.key});

  @override
  State<AliashtirakFiQaydiha> createState() => _AliashtirakFiQaydihaState();
}

class _AliashtirakFiQaydihaState extends State<AliashtirakFiQaydiha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: customAppBar(context,
            style: font12White600W(context, size: size_14(context)),
            title: "الاشتراك في قيدها",
            icon: Icons.account_circle_outlined, onPressed: () {
          popRoute(context);
        }),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(children: [
            StagesWidget(),
            SizedBox(height: 20),
            PersonalInformation(),
            custom_Button(context,
                h: 50,
                border_color: AppColors.secondaryColor,
                buttoncolor: AppColors.backgroundColor,
                title: "الاطلاع على العقد قبل التوقيع",
                onPressed: () {},
                style: font14SecondaryColor500W(context, size: size_12(context))),
            SizedBox(height: 20),
            custom_Button(context, h: 50, title: "توقيع العقد", onPressed: () {
              pushNewScreen(context, AppRoutes.verifySourceOfIncome);
            }, style: font12White500W(context, size: size_12(context))),
            SizedBox(height: 40),
          ]),
        ));
  }
}
