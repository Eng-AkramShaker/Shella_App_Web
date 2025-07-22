// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/common/widgets/buttons/custom_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/orders/domain/models/address_model.dart';

class AddressDetailsWidget extends StatelessWidget {
  final AddressModel address_model;
  const AddressDetailsWidget({super.key, required this.address_model});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          address_model.addressType == 'home'
              ? AppImages.homeIcon
              : address_model.addressType == 'office'
                  ? AppImages.workIcon
                  : AppImages.otherIcon,
          color: Theme.of(context).primaryColor,
          height: 28,
          width: 28,
        ),

        //

        SizedBox(
          width: size_20(context),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //
              address_model.address != "" || address_model.address!.isNotEmpty
                  ? Row(
                      children: [
                        Text("العنوان :  ", style: font11Black600W(context, size: size_14(context))),
                        Text(
                          address_model.address!,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: font10Grey500W(context, size: size_14(context)),
                        )
                      ],
                    )
                  : SizedBox(height: size_12(context)),
              address_model.house != "" || address_model.house!.isNotEmpty
                  ? Row(
                      children: [
                        Text("المنزل :  ", style: font11Black600W(context, size: size_14(context))),
                        Text(
                          " ${address_model.house}  ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: font10Grey500W(context, size: size_14(context)),
                        )
                      ],
                    )
                  : SizedBox(height: size_12(context)),
              address_model.streetNumber != "" || address_model.streetNumber!.isNotEmpty
                  ? Row(
                      children: [
                        Text("الشارع :  ", style: font11Black600W(context, size: size_14(context))),
                        Text(" ${address_model.streetNumber}",
                            maxLines: 1, overflow: TextOverflow.ellipsis, style: font11Black600W(context, size: size_14(context)))
                      ],
                    )
                  : SizedBox(height: size_18(context)),

              address_model.streetNumber != "" || address_model.streetNumber!.isNotEmpty
                  ? Row(
                      children: [
                        Text("الوصف :  ", style: font11Black600W(context, size: size_14(context))),
                        Text(
                          "${address_model.floor} ",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: font11Black600W(context, size: size_14(context)),
                        )
                      ],
                    )
                  : const SizedBox(),
              //
            ],
          ),
        ),
      ],
    );
  }
}
