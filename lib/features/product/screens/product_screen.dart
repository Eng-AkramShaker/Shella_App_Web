import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/divider/custom_divider.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';
import 'package:shella_design/features/product/controllers/product_controller.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/features/product/widgets/category/product_item.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ProductView extends StatefulWidget {
  final StoreModel store;

  const ProductView({super.key, required this.store});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  late ProductProvider _provider;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _provider = ProductProvider(storeId: widget.store.id);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _provider.loadProducts();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200) {
      if (_provider.hasMore && !_provider.isLoading) {
        _provider.loadProducts();
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductProvider>.value(
      value: _provider,
      child: Consumer<ProductProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              alignment: Alignment.center,
              children: [
                // Scroll Content
                Positioned.fill(
                  top: MediaQuery.of(context).size.height * 0.4,
                  child: provider.isLoading && provider.products.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.builder(
                          controller: _scrollController,
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: provider.hasMore ? provider.products.length + 1 : provider.products.length,
                          itemBuilder: (context, index) {
                            if (index == provider.products.length) {
                              // Loader at the end for pagination
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            final product = provider.products[index];
                            return ProductItem(
                              product: product,
                              onTap: () {
                                nav.push(AppRoutes.productDetails);
                              },
                            );
                          },
                        ),
                ),

                // Header Section
                Positioned(top: 0, left: 0, right: 0, child: buildHeaderSection(context)),

                // Store Info
                Positioned(
                  top: 150,
                  child: Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Custom_Text(context, text: widget.store.name, style: font14Black600W(context)),
                          const SizedBox(height: 10),
                          Custom_Text(
                            context,
                            text: "وقت التوصيل: ${widget.store.deliveryTime} دقيقة",
                            style: font11Black600W(context),
                          ),
                          const SizedBox(height: 15),
                          Custom_Divider(dashed: true, color: AppColors.gryColor_4),
                          const SizedBox(height: 12),
                          Custom_Text(
                            context,
                            text: "العنوان: ${widget.store.address}",
                            style: font10Grey600W(context),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Store Logo
                Positioned(
                  top: 130,
                  left: MediaQuery.of(context).size.width * 0.05,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          widget.store.logoUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.store),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          width: 15,
                          height: 15,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.greenColor,
                            border: Border.fromBorderSide(
                              BorderSide(color: Colors.white, width: 2),
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
        },
      ),
    );
  }

  Widget buildHeaderSection(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(widget.store.coverPhotoUrl),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 19,
            right: 19,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtonCircle(
                  icon: Icons.arrow_back_ios,
                  onPressed: () => Navigator.pop(context),
                ),
                Row(
                  children: [
                    IconButtonCircle(icon: Icons.search, onPressed: () {}),
                    const SizedBox(width: 12),
                    IconButtonCircle(
                      icon: Icons.share,
                      onPressed: () => Share.share(widget.store.name),
                    ),
                    const SizedBox(width: 12),
                    IconButtonCircle(
                      icon: Icons.favorite_border,
                      onPressed: () {},
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

  Widget buildSectionTitle(BuildContext context, {required String title, String? lapel}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Custom_Text(context, text: title, style: font14Black600W(context)),
          if (lapel != null)
            Custom_Text_Button(
              context,
              text: lapel,
              text_style: font14Black600W(context),
              underline: true,
              onPressed: () {},
            )
        ],
      ),
    );
  }
}
