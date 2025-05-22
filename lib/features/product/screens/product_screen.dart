import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/divider/custom_divider.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';
import 'package:shella_design/features/product/widgets/images/image_circle.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/features/product/widgets/category/category_list.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import '../widgets/category/pizza_item.dart';

class ProductView extends StatefulWidget {
  final StoreModel store;

  ProductView({super.key, required this.store});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSectionTitle(context, title: "الاصناف", lapel: "المزيد"),
                  SizedBox(height: 15.h),
                  SizedBox(width: width_media(context), child: CategoryList()),
                  SizedBox(height: 15.h),
                  Container(
                    color: AppColors.gryColor_8,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                    ),
                  ),
                  SizedBox(height: 15.h),
                  buildPizzaItemListView(context),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),

          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: buildHeaderSection(context, store: widget.store),
          ),

          // ✅ Store info card
          Positioned(
            top: 150,
            child: Card(
              color: Colors.white,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.9,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10.h),
                    Custom_Text(context,
                        text: widget.store.name,
                        style: font14Black600W(context)),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Custom_Text(context,
                            text: widget.store.deliveryTime,
                            style: font11Black600W(context)),
                      ],
                    ),
                    SizedBox(height: 15.h),
                    Custom_Divider(dashed: true, color: AppColors.gryColor_4),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Column(
                          children: [
                            Custom_Text(context,
                                text: "العنوان",
                                style: font11Black600W(context)),
                            SizedBox(height: 8.h),
                            Custom_Text(context,
                                text: widget.store.address,
                                style: font10Grey600W(context)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ✅ Store logo image
          Positioned(
            top: 130,
            child: Stack(
              children: [
                ImageCircle(img: widget.store.logoUrl),
                if (widget.store.open)
                  Positioned(
                    bottom: 5,
                    right: 0,
                    child: Container(
                      width: 10.w,
                      height: 10.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.greenColor,
                      ),
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

Widget buildHeaderSection(BuildContext context, {required StoreModel store}) {
  return SizedBox(
    height: 210.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(store.coverPhotoUrl),
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
        Positioned(
          top: 30.h,
          left: 19.w,
          right: 19.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButtonCircle(
                icon: Icons.arrow_back_ios,
                onPressed: () => Navigator.pop(context),
              ),
              Row(
                children: [
                  IconButtonCircle(icon: Icons.search, onPressed: () {}),
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                    icon: Icons.share,
                    onPressed: () {
                      Share.share(store.coverPhotoUrl,
                          subject: 'Check out this store!');
                    },
                  ),
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                    icon: Icons.favorite_border,
                    onPressed: () {
                      popRoute(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildSectionTitle(BuildContext context,
    {required String title, String? lapel}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text(context, text: title, style: font14Black600W(context)),
        Custom_Text_Button(
          context,
          text: lapel,
          text_style: font14Black600W(context),
          underline: true,
          onPressed: () {},
        )
      ],
    ),
  );
}

Widget buildPizzaItemListView(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.8,
    child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          10,
          (index) => PizzaItem(
            onTap: () {
              pushNewScreen(context, AppRoutes.productDetails);
            },
          ),
        ),
      ),
    ),
  );
}
