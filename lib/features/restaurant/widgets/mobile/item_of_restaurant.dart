import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/images/custom_Images.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';

class ItemOfRestaurant extends StatelessWidget {
  final String? title;
  final String? description;
  final double? price;
  final String? imageUrl;
  const ItemOfRestaurant({super.key,
  required this.title,
  required this.description,
  required this.price,
  required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 92,
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        Expanded(
          flex: 2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(context, text: title!,size: 14),
              SizedBox(height: 5.h,),
               Custom_Text(context, text: description!,textOverFlow: TextOverflow.ellipsis,maxLines: 2),
               SizedBox(height: 5.h,),
               Custom_Text(context, text: "${price.toString()} ريال", style: font10SecondaryColor600W(context)),
            ],
          )
          ),
       
            Container(
            
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Adjust the radius as needed
                child: custom_Images_asset(image: imageUrl!,w: 128,h: 89,fit: BoxFit.cover)),
                       ),
           
          
      ],
    ),
    );
  }
}