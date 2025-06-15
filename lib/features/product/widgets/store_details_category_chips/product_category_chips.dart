import 'package:flutter/material.dart';
import 'package:shella_design/features/product/domain/models/store_details_model.dart';

class ProductCategoryChips extends SliverPersistentHeaderDelegate {
  final List<CategoryModel> categories;
  final int? selectedId;
  final void Function(int?) onSelect;

  ProductCategoryChips({
    required this.categories,
    required this.selectedId,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            ChoiceChip(
              label: const Text('All'),
              selected: selectedId == null,
              onSelected: (_) => onSelect(null),
            ),
            const SizedBox(width: 8),
            ...categories.map((cat) => Row(
              children: [
                ChoiceChip(
                  label: Text(cat.name),
                  selected: selectedId == cat.id,
                  onSelected: (_) => onSelect(cat.id),
                ),
                const SizedBox(width: 8),
              ],
            )),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => 56;
  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant ProductCategoryChips oldDelegate) {
    return oldDelegate.selectedId != selectedId ||
        oldDelegate.categories.length != categories.length;
  }
}
