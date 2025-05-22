import 'package:shella_design/features/address/screens/web/address_button.dart';
import 'package:flutter/material.dart';

class AddressTypeSelector extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTypeSelected;

  const AddressTypeSelector({
    super.key,
    required this.selectedIndex,
    required this.onTypeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      width: 950,
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildAddressButton(0, Icons.home_outlined),
            _buildAddressButton(1, Icons.business_center),
            _buildAddressButton(2, Icons.grid_view),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressButton(int index, IconData icon) {
    return SizedBox(
      height: 65,
      width: 260,
      child: AddressButton(
        isSelected: selectedIndex == index,
        onPressed: () => onTypeSelected(index),
        icon: icon,
      ),
    );
  }
}
