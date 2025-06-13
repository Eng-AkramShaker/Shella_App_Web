import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/extensions/timeExtensions/time_extensions.dart';
import 'package:shella_design/common/widgets/gap/gapHeight/gap_height.dart';
import 'package:shella_design/features/product/controllers/product_controller.dart';
import '../../../../../common/util/app_colors.dart';
import '../../../../../common/util/app_styles.dart';
import '../../../../../common/widgets/divider/custom_divider.dart';
import '../../../../../common/widgets/loading/loading.dart';
import '../../../../../common/widgets/texts/custom_text.dart';
import '../../../widgets/mobile/storeDetails/storeItems/store_items.dart';
import '../product_screen.dart';

class StoreDetails extends StatelessWidget {
  const StoreDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ProductController.get(context).storeDetailsModel==null?
      Column(
        children: [
          SizedBox(height: 10,),
          buildHeaderSection(context,isLoading: true),
          GapHeight(gap: 0.2),
          Loading(),
        ],
      ):
      Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.4,
            child: StoreItems(),
          ),
          Positioned(top: 0, left: 0, right: 0, child: buildHeaderSection(context,image: ProductController.get(context).storeDetailsModel!.logoFullUrl,isLoading: ProductController.get(context).storeDetailsModel==null)),
          Positioned(
            top: 150,
            child: Card(
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.gryColor_8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Custom_Text(context, text: ProductController.get(context).storeDetailsModel!.name??'', style: font14Black600W(context)),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Custom_Text(context, text: ProductController.get(context).storeDetailsModel!.metaTitle??'', style: font10SecondaryColor600W(context)),
                        Custom_Text(context, text: "\u200E${ProductController.get(context).storeDetailsModel!.schedules?[0].closingTime?.to12Format()} - ${ProductController.get(context).storeDetailsModel!.schedules?[0].openingTime?.to12Format()}", style: font11Black600W(context)),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Custom_Divider(dashed: true, color: AppColors.gryColor_4),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Custom_Text(context, text: "قيمة التوصيل", style: font11Black600W(context)),
                            SizedBox(height: 8.h),
                            Custom_Text(context, text: "25 ريال", style: font10SecondaryColor600W(context)),
                          ],
                        ),
                        Column(
                          children: [
                            Custom_Text(context, text: "المسافة", style: font11Black600W(context)),
                            SizedBox(height: 8.h),
                            Custom_Text(context, text: "${ProductController.get(context).storeDetailsModel!.distance?.round()??0/1000} كم", style: font10Grey600W(context)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 130,
            child: Stack(
              children: [
                Card(
                  color: AppColors.wtColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),side: BorderSide(color: AppColors.gryColor_9)),
                  child: CircleAvatar(
                    backgroundColor: AppColors.wtColor,
                    backgroundImage: NetworkImage(ProductController.get(context).storeDetailsModel!.logoFullUrl??''),
                  ),
                ),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.greenColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}