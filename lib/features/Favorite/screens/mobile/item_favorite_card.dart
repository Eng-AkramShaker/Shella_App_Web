import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/Favorite/controllers/discount_controller.dart';
import 'package:shella_design/features/Favorite/domain/models/item_model.dart';

class ItemFavoriteCard extends StatelessWidget {
  final Item item;

  const ItemFavoriteCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image Container with Favorite Icon
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
                child: Image.network(
                  item.image ?? '',
                  height: 120.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 120.h,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Icon(Icons.image_not_supported,
                          size: 50.sp, color: Colors.grey),
                    );
                  },
                ),
              ),
              Positioned(
                top: 5.h,
                right: 5.w,
                child: Consumer<FavoriteController>(
                  builder: (context, favoriteController, child) {
                    return InkWell(
                      onTap: () {
                        favoriteController.removeFromFavoriteList(
                            item.id!, false);
                      },
                      child: Container(
                        padding: EdgeInsets.all(5.w),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: Icon(
                          Icons.favorite,
                          color: Colors.green,
                          size: 20.sp,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),

          // Product Details
          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  item.name ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 5.h),

                // Store Name
                Text(
                  item.storeName ?? '',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 5.h),

                // Price
                Text(
                  '${item.price?.toStringAsFixed(2) ?? '0.00'} ريال',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),

          // Add to Cart Button
          Padding(
            padding: EdgeInsets.all(8.w),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                ),
                child: Text(
                  'إضافة للسلة',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
