// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/widgets/custom_button.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/widget/personal_information.dart';

class Step_1_Screen extends StatefulWidget {
  const Step_1_Screen({super.key});

  @override
  State<Step_1_Screen> createState() => _Step_1_ScreenState();
}

class _Step_1_ScreenState extends State<Step_1_Screen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<KaidhaSubscription_Controller>(builder: (context, KaidhaSubController, _) {
      return Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              KaidhaSubController.isLoading
                  ? SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          SizedBox(height: 20),

                          //

                          PersonalInformation(),

                          //
                          SizedBox(height: 20),
                          Container(
                            width: 1170,
                            padding: EdgeInsets.all(size_10(context)),
                            child: CustomButton(
                              isLoading: false,
                              buttonText: "التالي ",
                              onPressed: () async {
                                KaidhaSubController.validate_Fields_Screen_1(context);

                                //
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          ),
        ),
      );
    });
  }
}
