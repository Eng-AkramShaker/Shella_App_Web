import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/phone_number/custom_phonenumber.dart';
import 'package:shella_design/helper/app_routes.dart';
import 'package:shella_design/util/app_images.dart';
import 'package:shella_design/util/app_navigators.dart';

class Forgetpassword extends StatelessWidget {
  const Forgetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            size: 30,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            custom_Images_asset(
              image: AppImages.forgetpassword,
              h: size.height / 3.5,
              w: size.width / 1.5,
              fit: BoxFit.fill,
            ),
            SizedBox(height: size.height / 30),
            CustomPhoneInput(
              controller: phone,
              onChanged: (p0) {
                pushNewScreen(context, AppRoutes.mobilelVerification);
              },
            )
          ],
        ),
      ),
    );
  }
}
