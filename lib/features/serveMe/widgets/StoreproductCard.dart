import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/util/app_colors.dart';

class StoreproductCard extends StatelessWidget {
  const StoreproductCard({
    super.key,
    required this.product,
  });

  final Map<String, String> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // or your desired background
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: AppColors.bgColor.withOpacity(0.2), // subtle and soft
            blurRadius: 5,
            spreadRadius: 0,
            offset: const Offset(0, 0), // pushes shadow down and outward
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              child: Image.asset(
                product['image']!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product['name']!,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(Icons.add_circle_outline, color: Colors.green),
                    Text(
                      'ر.س ${product['price']}',
                      style: const TextStyle(color: AppColors.orangeColor, fontWeight: FontWeight.w600),
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
}
