import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/discount/domain/models/discount_model.dart';
class DiscountGridContent extends StatelessWidget {
  const DiscountGridContent({
    super.key,
    required this.product,
  });

  final DiscountProduct product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.w),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image 
          Container(
            height: 120.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                  top: Radius.circular(16.w)),
              child: Image.network(
                product.image,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Icon(Icons.image, size: 40.w),
                  ),
                ),
              ),
            ),
          ),
          
          // Discount Badge
          Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 8.w, vertical: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.greenColor,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Text(
                  'خصم ${((product.price - product.finalPrice) / product.price * 100).toStringAsFixed(0)}%',
                  style: TextStyle(
                    color:  Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          
          // Product Details
          Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product Name
                Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2, // 
                  overflow: TextOverflow.ellipsis,
                ),
                
                SizedBox(height: 4.h),
                
                // Store Name
                Text(
                  product.storeName,
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
                  ),
                ),
                
                SizedBox(height: 8.h),
                
                // Price
                Row(
                  children: [
                    // Original Price
                    Text(
                      '${product.price.toStringAsFixed(2)} ر.س',
                      style: TextStyle(
                        fontSize: 12.sp,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    
                    SizedBox(width: 8.w),
                    
                    // Discounted Price
                    Text(
                      '${product.finalPrice.toStringAsFixed(2)} ر.س',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: AppColors.secondaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: 8.h),
                
                // Available Stock
                Text(
                  'الكمية المتاحة: ${product.stock}',
                  style: TextStyle(
                    fontSize: 12.sp,
                    color: Colors.black,
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