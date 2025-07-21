import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';
import 'package:shella_design/features/home/home/widgets/builds/build_section_title_two.dart';
import 'package:shella_design/features/restaurant/widgets/mobile/buildcategories.dart';
import 'package:shella_design/features/restaurant/widgets/mobile/restaurant_items.dart';
import 'package:shella_design/features/serveMe/screens/serve_product_screen.dart';

class RestaurantDetails extends StatefulWidget {
    // final restaurantModel restaurant;

   const RestaurantDetails({super.key});

  @override
  State<RestaurantDetails> createState() => _RestaurantDetailsState();
}

class _RestaurantDetailsState extends State<RestaurantDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children:  [
            SizedBox(
              height: MediaQuery.of(context).size.height *0.4,
              child: Stack(
              alignment: Alignment.center,
              children: [
                    
                      Positioned(
                          top: 0,
                          left: 0,
                          right: 0,
                          child: buildHeaderSection(context)),
                      
                      
                          // Restaurant  Info
                      Positioned(
                        top: 150,
                        child: Card(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Custom_Text(context,
                                text:"سوبر برغر-جدة-الطريق 11",
                                    // text: widget.restaurant.name,
                                    style: font14Black600W(context)),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Custom_Text(
                                      context,
                                      text:"سندويش بيتزا ",
                                       // text:  "${widget.restaurant.module!.moduleType}" ,
                                      style: font6SecondaryColor400W(context,size: 12),
                                    ),
                                    Custom_Text(context,
                                    text:"10:00 PM - 1:00 AM",
                                   // text: widget.restaurant.currentOpeningTime ?? "10:00 Pm",
                                    style: font12Black400W(context)),
                      
                                  ],
                                ),
                                const SizedBox(height: 15),
                                
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Custom_Text(
                                      context,
                                      text: "قيمة التوصيل",
                                      style: font12Black400W(context),
                                    ),
                      
                                    Custom_Text(
                                      context,
                                      text: " المسافة",
                                      style: font12Black400W(context),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                     Custom_Text(
                                      context,
                                    //  text: "${widget.restaurant.deliveryFeeTax}",
                                    text:"25 ريال",
                                      style: font6SecondaryColor400W(context,size: 12),
                                    ),
                      
                                    Custom_Text(
                                      context,
                                      text:"15 كم",
                                     // text: "${widget.restaurant.distance}",
                                      style: font12Black400W(context),
                                    ),
                                  ],
                                
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      
                        //store logo
                         Positioned(
                        top: 130,
                        left: MediaQuery.of(context).size.width * 0.45,
                        child: Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                              //  widget.restaurant.logoUrl,
                              "https://mediaassets.cbre.com/cdn/-/media/project/cbre/shared-site/menat/saudi-arabia/articles/saudi-arabia-market-review-q2-2024/ksaq22024_report_image.png?iar=0&rev=e2547eb45e9b46eab325aac9f13e5303&key=articlehero-wideimage&device=desktop",
                                width: 40,
                                height: 40,
                                fit: BoxFit.cover,
                                errorBuilder: (_, __, ___) => const Icon(Icons.store),
                              ),
                            ),
                            Positioned(
                              bottom: 5,
                              right: 5,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.greenColor,
                                  border: Border.fromBorderSide(
                                    BorderSide(color: Colors.white, width: 2),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      
              ],
                      ),
            ),
        
           SizedBox(height: 10.h),
           
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: buildSectionTitleTow(context, title: " الأصناف", lapel: "المزيد", underline: true),
                ),
                         SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                 child: Buildcategories()
        
                  ),
                SizedBox(height: 10.h),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: buildSectionTitleTow(context, title: " السندويش",underline: false),
                ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: RestaurantItems()
                  )
             ] ),
      ),

    );
  }
}