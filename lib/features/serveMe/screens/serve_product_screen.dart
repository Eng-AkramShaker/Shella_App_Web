import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/divider/custom_dashed_divider.dart';
import 'package:shella_design/features/product/widgets/images/image_circle.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/serveMe/widgets/LocationInfo.dart';
import 'package:shella_design/features/serveMe/widgets/StoreproductCard.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ServeMeProductView extends StatefulWidget {
  const ServeMeProductView({super.key});

  @override
  State<ServeMeProductView> createState() => _ServeMeProductViewState();
}

class _ServeMeProductViewState extends State<ServeMeProductView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // ✅ الخلفية والهيدر في الأعلى
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
              // ✅ الحل الصحيح
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 5),
                  _buildCategoryFilters(),
                  const SizedBox(height: 0),
                  _buildProductGrid(),
                  const SizedBox(height: 20),
                  LocationInfo(
                    icon: Icons.access_time,
                    title: 'ساعات العمل',
                    content:
                        'السبت - الخميس: 9:00 صباحاً - 11:00 مساءً\nالجمعة: 2:00 مساءً - 11:00 مساءً',
                  ),
                  const SizedBox(height: 12),
                  LocationInfo(
                    icon: Icons.location_on_outlined,
                    title: 'الموقع',
                    content: '7754 طريق الدائري، 3477، الرياض، الرياض 362221',
                    image: 'assets/images/map.png',
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: buildHeaderSection(context),
          ),
          // title and information about item
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
                        text: 'متجر العراب', style: font14Black600W(context)),
                    SizedBox(height: 8.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Custom_Text(
                          context,
                          text: 'ادوات سباكة وكهرباء',
                          style: font12Green300W(context),
                        ),
                        Custom_Text(
                          context,
                          text: "مفتوح - يغلق 11 مساء",
                          style: font11Black600W(context),
                        ),
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
                            Custom_Text(context,
                                text: "قيمة التوصيل",
                                style: font11Black600W(context)),
                            SizedBox(height: 8.h),
                            Custom_Text(context,
                                text: "25 ريال",
                                style: font10SecondaryColor600W(context)),
                          ],
                        ),
                        Column(
                          children: [
                            Custom_Text(context,
                                text: "المسافة",
                                style: font11Black600W(context)),
                            SizedBox(height: 8.h),
                            Custom_Text(context,
                                text: "15 كم", style: font10Grey600W(context)),
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
                ImageCircle(img: AppImages.fRAME31),
                Positioned(
                  bottom: 5,
                  right: 0,
                  child: Container(
                    width: 10.w,
                    height: 10.h,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: AppColors.greenColor),
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

Widget buildHeaderSection(BuildContext context) {
  return SizedBox(
    height: 210.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        // header image
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.fRAME31), fit: BoxFit.fill),
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
              Row(
                children: [
                  IconButtonCircle(
                      icon: Icons.arrow_back_ios,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ],
              ),
              Row(
                children: [
                  IconButtonCircle(icon: Icons.search, onPressed: () {}),
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                      icon: Icons.share,
                      onPressed: () {
                        Share.share('url',
                            subject: 'Sharing Text Field Content');
                      }),
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                      icon: Icons.favorite_border,
                      onPressed: () {
                        nav.back();
                      }),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildSectionTitle(context, {required title, String? lapel}) {
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

Widget _buildCategoryFilters() {
  final List<String> categories = [
    'الكل',
    'أدوات',
    'معدات',
    'صحية',
    'كهربائية'
  ];
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: categories.map((cat) {
      final bool isSelected = cat == 'الكل';
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF4CAF50) : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Text(
          cat,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
    }).toList(),
  );
}

Widget _buildProductGrid() {
  final List<Map<String, String>> products = [
    {
      'name': 'طقم عدة متكامل',
      'price': '299.99',
      'image': 'assets/images/FRAME (5) 1.png',
    },
    {
      'name': 'مفك كهربائي احترافي',
      'price': '199.99',
      'image': 'assets/images/FRAME (5) 1.png',
    },
    {
      'name': 'مفك كهربائي احترافي',
      'price': '199.99',
      'image': 'assets/images/FRAME (5) 1.png',
    },
    {
      'name': 'مفك كهربائي احترافي',
      'price': '199.99',
      'image': 'assets/images/FRAME (5) 1.png',
    },
  ];

  return GridView.builder(
    physics: const NeverScrollableScrollPhysics(),
    shrinkWrap: true,
    itemCount: products.length,
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.8,
    ),
    itemBuilder: (context, index) {
      final product = products[index];
      return StoreproductCard(product: product);
    },
  );
}
