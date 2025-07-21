// ignore_for_file: use_key_in_widget_constructors, camel_case_types, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/appBar/mobile/appBar_mobile.dart';
import 'package:shella_design/common/widgets/custom_button.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/controllers/kaidhaSub_controller.dart';
import 'package:shella_design/features/wallet_kaidha_subscription/widget/dialog.dart/success_celebration_dialog.dart';

class Qr_Screen extends StatefulWidget {
  @override
  _Qr_ScreenState createState() => _Qr_ScreenState();
}

class _Qr_ScreenState extends State<Qr_Screen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String? otpCode;

  @override
  void reassemble() {
    super.reassemble();
    controller?.pauseCamera();
    controller?.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: custom_AppBar(
        context,
        title: "أسكان QR",
        icon: Icons.arrow_back_sharp,
        img_icon: AppImages.qr,
        onPressed: () {
          nav.back();
        },
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              width: 400,
              padding: EdgeInsets.all(size_15(context)),
              child: CustomButton(
                isLoading: false,
                buttonText: otpCode != null ? "QR:  $otpCode" : "فحص QR code",
                onPressed: () async {
                  //
                  if (otpCode != null) {
                    // Get.offNamed(RouteHelper.getKiadaWalletSubscription());

                    // showDialog(
                    //   context: context,
                    //   barrierDismissible: false, // لا يمكن إغلاقه بالضغط بالخارج
                    //   barrierColor: Colors.white, // خلفية شفافة جداً
                    //   builder: (_) => const Dialog(
                    //     backgroundColor: Colors.transparent, // يجعل خلفية الـ Dialog نفسه شفافة
                    //     insetPadding: EdgeInsets.all(0), // لا يوجد هامش
                    //     child: SuccessCelebrationWidget(),
                    //   ),
                    // );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;

    controller.scannedDataStream.listen((scanData) {
      final code = scanData.code;

      if (code != null) {
        controller.pauseCamera();

        if (mounted) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              otpCode = code;
              Provider.of<KaidhaSubscription_Controller>(context, listen: false).qr.text = code;
            });
          });
        }
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
