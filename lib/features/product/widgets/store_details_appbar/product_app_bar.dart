import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_styles.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';

class ProductAppBar extends StatelessWidget {
  final StoreModel store;

  const ProductAppBar({super.key, required this.store});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 310,
      pinned: true,
      leading: IconButtonCircle(
        icon: Icons.arrow_back_ios,
        onPressed: () => Navigator.pop(context),
      ),
      actions: [
        IconButtonCircle(icon: Icons.search, onPressed: () {}),
        IconButtonCircle(
          icon: Icons.share,
          onPressed: () => Share.share(
              'Check out ${store.name} on Shella!\n${store.address}'),
        ),
        IconButtonCircle(icon: Icons.favorite_border, onPressed: () {}),
      ],
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                store.coverPhotoUrl.isNotEmpty
                    ? store.coverPhotoUrl
                    : AppImages.empty,
                fit: BoxFit.cover,
              ),
            ),
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.transparent,
                      Colors.white.withOpacity(0.9),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
            Positioned(
              left: 16,
              right: 16,
              bottom: 16,
              child: _StoreInfo(store: store),
            ),
          ],
        ),
      ),
    );
  }
}

class _StoreInfo extends StatelessWidget {
  final StoreModel store;

  const _StoreInfo({required this.store});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.network(
              store.logoUrl.isNotEmpty ? store.logoUrl : AppImages.empty,
              width: 72,
              height: 72,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Custom_Text(context,
                    text: store.name, style: font14Black600W(context)),
                const SizedBox(height: 6),
                Custom_Text(context,
                    text: store.address, style: font14Black600W(context)),
                const SizedBox(height: 6),
                Custom_Text(context,
                    text: 'وقت التوصيل: ${store.deliveryTime} دقيقة',
                    style: font14Black600W(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
