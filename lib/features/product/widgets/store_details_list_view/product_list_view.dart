import 'package:flutter/material.dart';
import 'package:shella_design/features/product/controllers/store_details_provider.dart';
import 'package:shella_design/features/product/screens/product_details_screen.dart';
import 'package:shella_design/features/product/widgets/category/product_item.dart';

class ProductListView extends StatelessWidget {
  final StoreDetailsProvider provider;

  const ProductListView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    if (provider.isLoading && provider.products.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return RefreshIndicator(
      onRefresh: () => provider.loadProducts(refresh: true),
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: provider.hasMore
            ? provider.products.length + 1
            : provider.products.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          if (index == provider.products.length) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Center(child: CircularProgressIndicator()),
            );
          }

          final product = provider.products[index];
          return ProductItem(
            product: product,
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductDetailsView(product: product),
              ),
            ),
          );
        },
      ),
    );
  }
}
