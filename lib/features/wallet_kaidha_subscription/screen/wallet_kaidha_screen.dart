// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously, empty_catches, unnecessary_null_comparison

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/appBar/mobile/appBar_mobile.dart';
import 'package:shella_design/common/widgets/custom_snackbar.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/text_button.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/widget/available_balance.dart';
import '../widget/payment_details.dart';

class WalletKaidhaScreen extends StatefulWidget {
  const WalletKaidhaScreen({super.key});

  @override
  State<WalletKaidhaScreen> createState() => _WalletKaidhaScreenState();
}

class _WalletKaidhaScreenState extends State<WalletKaidhaScreen> {
  @override
  void initState() {
    super.initState();
    getDate(context);
  }

  void getDate(BuildContext context) async {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final controller = Provider.of<KaidhaSubscription_Controller>(context, listen: false);

      await controller.get_Wallet_Kaidh();
      controller.another_amount.text = "0.00";

      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.wtColor,
      appBar: custom_AppBar(
        context,
        title: 'kiadha_wallet'.tr(),
        icon: Icons.arrow_back_sharp,
        titleIcon: Icons.account_balance_wallet_outlined,
      ),
      body: Consumer<KaidhaSubscription_Controller>(builder: (context, KaidhaSubController, _) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: KaidhaSubController.isLoading_wallet == true
                ? SizedBox(
                    height: height_media(context) * .7,
                    child: Center(child: CircularProgressIndicator()),
                  )
                : KaidhaSubController.walletKaidhaModel!.wallet == null || KaidhaSubController.walletKaidhaModel == null
                    ? Center(
                        child: PaymentDetailsShimmer(),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          PaymentDetails(wallet: KaidhaSubController.walletKaidhaModel!.wallet!),

                          //

                          SizedBox(height: 20),

                          //

                          KaidhaSubController.walletKaidhaModel!.wallet!.status != "Active"
                              ? SizedBox(height: 20)
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    PaymentOptions(wallet: KaidhaSubController.walletKaidhaModel!.wallet!),

                                    //

                                    SizedBox(height: 20),

                                    Text('أدخل مبلغ آخر', style: font13Black400W(context)),

                                    SizedBox(height: 10),

                                    CustomTextField(
                                      labelText: '',
                                      controller: KaidhaSubController.another_amount,
                                      suffixIcon: Image.asset(AppImages.sar, width: 20, height: 20),
                                    ),

                                    SizedBox(height: 80),

                                    // payment button

                                    TextButtonWidget(
                                      text: 'الدفع الآن',
                                      backgroundColor: AppColors.secondaryColor,
                                      textStyle: font13White400W(context),
                                      height: 60,
                                      width: double.infinity,
                                      radius: 16,
                                      verticalPadd: 0,
                                      horizontalPadd: 0,
                                      onPressed: () async {
                                        //

                                        if (KaidhaSubController.another_amount == null ||
                                            KaidhaSubController.another_amount.text == "0.00") {
                                          showCustomSnackBar(context, " لم يتم ادخال اي مبلغ بعد ...");

                                          return;
                                        }

                                        await KaidhaSubController.Send_Pay_Credit(
                                          context,
                                          double.parse(KaidhaSubController.another_amount.text),
                                        );
                                      },
                                    )
                                  ],
                                ),
                        ],
                      ),
          ),
        );
      }),
    );
  }
}

 

// ||
//                     KaidhaSubController.walletKaidhaModel!.wallet == null ||
//                     KaidhaSubController.walletKaidhaModel == null


// void  showCustomSnackBar(context,String message, {bool isError = true, int? showDuration}) {

//   Get.dialog(
//     Center(
//       child: Padding(
//         padding: const EdgeInsets.all(30),
//         child: Container(
//           height: 250,
//           // width: 400,
//           padding: EdgeInsets.all(20),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(isError ? Icons.error : Icons.check_circle, color: isError ? Colors.red : Colors.green, size: 50),
//               const SizedBox(height: 20),
//               Text(message, style: TextStyle(color: Colors.black, fontSize: 16), textAlign: TextAlign.center),
//             ],
//           ),
//         ),
//       ),
//     ),
//     barrierDismissible: false,
//   );

//   Future.delayed(Duration(seconds: showDuration ?? 1), () {
//     if (Get.isDialogOpen ?? false) {
//       Get.back();
//     }
//   });
// }
