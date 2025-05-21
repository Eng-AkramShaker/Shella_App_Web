import 'package:shella_design/common/util/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/features/address/domain/models/address_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AddressCard extends StatelessWidget {
  final Address address;
  final bool isSelected;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;
  final VoidCallback onTap;

  const AddressCard({
    super.key,
    required this.address,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: isSelected ? AppColors.secondaryColor : AppColors.gryColor_3,
            width: isSelected ? 2 : 1,
          ),
          color: AppColors.backgroundColor,
        ),
        child: Card(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildAddressInfo(context),
                _buildActionButtons(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAddressInfo(BuildContext context) {
    return SizedBox(
      width: 270,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(
            _getAddressTypeSvg(),
            height: 35,
            width: 35,
            colorFilter: ColorFilter.mode(
              isSelected ? AppColors.secondaryColor : AppColors.primaryColor,
              BlendMode.srcIn,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Custom_Text(
                context,
                text: _getAddressTypeText(),
                style: font10Black400W(context, size: 24),
              ),
              const SizedBox(height: 10),
              Custom_Text(
                context,
                text: address.address,
                style: font10Grey400W(context, size: 15),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtons() {
    return SizedBox(
      width: 110,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onEditPressed,
            icon: SvgPicture.asset(
              'assets/svg/edit-icon.svg',
              height: 25,
              width: 25,
            ),
            iconSize: 35,
          ),
          IconButton(
            onPressed: onDeletePressed,
            icon: SvgPicture.asset(
              'assets/svg/delete-icon.svg',
              height: 25,
              width: 25,
            ),
            iconSize: 35,
          ),
        ],
      ),
    );
  }

  String _getAddressTypeSvg() {
    switch (address.addressType.toLowerCase()) {
      case 'منزل':
        return 'assets/svg/home-icon.svg';
      case 'عمل':
        return 'assets/svg/job-address.svg';
      default:
        return 'assets/svg/home-address.svg';
    }
  }

  String _getAddressTypeText() {
    return address.addressType;
  }
}
