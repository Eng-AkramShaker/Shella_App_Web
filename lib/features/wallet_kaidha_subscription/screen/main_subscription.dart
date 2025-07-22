// ignore_for_file: prefer_const_literals_to_create_immutables, non_constant_identifier_names, deprecated_member_use, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/appBar/mobile/appBar_mobile.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/screen/show_pdf_screen.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/screen/subscription_steps/step1_screen.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/screen/subscription_steps/step2_screen.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/screen/subscription_steps/step3_screen.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/widget/stages_widget.dart';

class KiadaWalletSubscriptionScreen extends StatefulWidget {
  const KiadaWalletSubscriptionScreen({super.key});

  @override
  State<KiadaWalletSubscriptionScreen> createState() => _KiadaWalletSubscriptionScreenState();
}

class _KiadaWalletSubscriptionScreenState extends State<KiadaWalletSubscriptionScreen> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    getDate(context);
  }

  getDate(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final controller = Provider.of<KaidhaSubscription_Controller>(context, listen: false);
      controller.get_Wallet_Kaidh();
      controller.get_Pdf();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<KaidhaSubscription_Controller>(
      builder: (context, KaidhaSubController, _) {
        // ✅ تمرير لأعلى فقط عند الوصول إلى المرحلة 2
        if (KaidhaSubController.currentStage == 2) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (_scrollController.hasClients) {
              _scrollController.jumpTo(0);
            }
          });
        }

        return Scaffold(
          backgroundColor: AppColors.wtColor,
          appBar: custom_AppBar(
            context,
            title: 'KiadaWallet_Subscription'.tr(),
            icon: Icons.arrow_back_sharp,
            img_icon: AppImages.KiadaWalletSubscription,
            onPressed: () {
              if (KaidhaSubController.currentStage == 1) {
                nav.back();
              } else {
                KaidhaSubController.nextStage(context, isNext: false);
              }
            },
          ),
          body: KaidhaSubController.isLoading_Show_Pdf
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: KaidhaSubController.walletKaidhaModel?.wallet != null
                      ? Show_Pdf_Screen()
                      : Column(
                          children: [
                            StagesWidget(),
                            Expanded(
                              child: SingleChildScrollView(
                                controller: _scrollController,
                                child: Column(
                                  children: [
                                    KaidhaSubController.currentStage == 1
                                        ? Step_1_Screen()
                                        : KaidhaSubController.currentStage == 2
                                            ? Step_2_Screen()
                                            : KaidhaSubController.currentStage == 3
                                                ? SizedBox(
                                                    height: height_media(context) / 1.5,
                                                    child: Step_3_Screen(),
                                                  )
                                                : SizedBox(),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                ),
        );
      },
    );
  }
}
