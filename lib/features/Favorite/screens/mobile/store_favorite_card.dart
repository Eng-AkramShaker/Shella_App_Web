import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/features/Favorite/controllers/discount_controller.dart';
import 'package:shella_design/features/Favorite/domain/models/store_model.dart';

class StoreFavoriteCard extends StatelessWidget {
  final Store store;

  const StoreFavoriteCard({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
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
        children: [
          // Cover Image and Logo
          Stack(
            clipBehavior: Clip.none,
            children: [
              // Cover Image
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r),
                ),
                child: Image.network(
                  store.cover ?? '',
                  height: 100.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 100.h,
                      width: double.infinity,
                      color: Colors.grey[200],
                      child: Icon(Icons.image_not_supported, size: 50.sp, color: Colors.grey),
                    );
                  },
                ),
              ),
              
              // Logo
              Positioned(
                bottom: -25.h,
                right: 20.w,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 3,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.r),
                    child: Image.network(
                      store.logo ?? '',
                      height: 50.h,
                      width: 50.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 50.h,
                          width: 50.w,
                          color: Colors.white,
                          child: Icon(Icons.store, size: 30.sp, color: Colors.grey),
                        );
                      },
                    ),
                  ),
                ),
              ),
              
              // Favorite Icon
              Positioned(
                top: 10.h,
                left: 10.w,
                child: Consumer<FavoriteController>(
                  builder: (context, favoriteController, child) {
                    return InkWell(
                      onTap: () {
                        favoriteController.removeFromFavoriteList(store.id!, true);
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
          
          SizedBox(height: 30.h),
          
          // Store Details
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Store Name
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      store.name ?? '',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber, size: 16.sp),
                        SizedBox(width: 3.w),
                        Text(
                          '${store.rating?.toStringAsFixed(1) ?? '0.0'}',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                
                // Store Address
                Row(
                  children: [
                    Icon(Icons.location_on_outlined, color: Colors.grey, size: 16.sp),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Text(
                        store.address ?? '',
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                
                // Visit Store Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to store page
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      padding: EdgeInsets.symmetric(vertical: 10.h),
                    ),
                    child: Text(
                      'زيارة المتجر',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
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