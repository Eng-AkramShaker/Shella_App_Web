import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
    
class AcceptPartner extends StatefulWidget {
  const AcceptPartner({Key? key}) : super(key: key);

  @override
  _AcceptPartnerState createState() => _AcceptPartnerState();
}

class _AcceptPartnerState extends State<AcceptPartner> {

   bool _isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.all(8),
      width: double.infinity,
      decoration: BoxDecoration(
        color:AppColors.wtColor,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: Colors.grey.shade200
        )
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            custom_Images_asset(image: AppImages.carsym,w: 22,h: 22),
            Custom_Text(context,text: "قبول أقرب شريك مقابل " "68 SAR" "تلقائيا",style: font13Black400W(context)),
            Switch( value: _isSwitched,
            onChanged: (value) {
            setState(() {
              _isSwitched = value;
            });
            },
            activeColor: AppColors.primaryColor, // optional
                      //  activeTrackColor: Colors.blue.withOpacity(0.5), // optional
            inactiveThumbColor: AppColors.wtColor, // optional
            inactiveTrackColor: AppColors.gryColor_12, // optional
             )
          ],
          
        ),
      ),
      
      
      );
  }
}