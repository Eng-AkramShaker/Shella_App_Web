import 'package:flutter/material.dart';
import 'package:shella_design/common/util/navigation/navigation.dart';
import 'package:provider/provider.dart';
import 'package:shella_design/common/widgets/textField/custom_textfield_2.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/features/product/domain/models/product_model.dart';
import 'package:shella_design/features/search_filter/controller/product_provider.dart';
import 'package:shella_design/features/search_filter/controller/search_filter_controller.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import '../widget/mobile/category_tabs.dart';
import '../widget/mobile/location_header.dart';
import '../widget/mobile/most_searched_list.dart';
import '../widget/mobile/search_history_section.dart';

class SearchFilter extends StatefulWidget {
  const SearchFilter({super.key});

  @override
  State<SearchFilter> createState() => _SearchFilterState();
}

class _SearchFilterState extends State<SearchFilter> {
  @override
  void initState() {
    super.initState();
    // Fetch products when the SearchFilter screen initializes
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProductProviderr>(context, listen: false).fetchProducts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final searchFilterController = Provider.of<SearchFilterController>(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        ],
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Custom_Text(
          context,
          text: "بحث",
          color: AppColors.bgColor,
          style: font10Black600W(context, size: size_14(context)),
        ),
      ),
      body: Consumer<ProductProviderr>(
        builder: (context, productProvider, child) {
          return ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              LocationHeader(
                num: searchFilterController.cartNum,
                sites: searchFilterController.sites,
              ),
              const CustomTextField(
                radius: 20,
                borderWidth: 2,
                borderColor: AppColors.gryColor_3,
                padding: 0,
                labelText: 'البحث',
                prefixIcon: Icon(Icons.search, size: 25),
              ),
              CategoryTabs(
                initialCategory: searchFilterController.selectedCategory,
                onCategoryChanged: (category) => setState(
                    () => searchFilterController.selectedCategory = category),
              ),
              SearchHistorySection(
                previousSearches: searchFilterController.previousSearches,
                context: context,
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Custom_Text(context,
                    text: "الاكثر بحثا",
                    style: font10Grey400W(context, size: size_10(context))),
              ),
              // SizedBox(height: 10),
              // // MostSearchedList(),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //   child: Custom_Text(context,
              //       text: "المنتجات الشائعة",
              //       style: font10Grey400W(context, size: size_10(context))),
              // ),
              const SizedBox(height: 10),
              if (productProvider.isLoading)
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(20.0), // Padding for loader
                  child: CircularProgressIndicator(),
                ))
              else if (productProvider.errorMessage != null)
                Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0), // Padding for error
                  child: Text('Error: ${productProvider.errorMessage}'),
                ))
              else if (productProvider.products.isEmpty)
                const Center(
                    child: Padding(
                  padding: EdgeInsets.all(20.0), // Padding for no products
                  child: Text('No popular products found.'),
                ))
              else
                // Using Column + Flexible instead of Expanded directly inside ListView
                // This is because ListView children should not have unbounded height constraints
                Column(
                  children: productProvider.products.map((product) {
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      elevation: 4.0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            product.image.isNotEmpty
                                ? SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Image.network(
                                      product.image,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return const Icon(Icons.broken_image,
                                            size: 40);
                                      },
                                    ),
                                  )
                                : const SizedBox(
                                    width: 80,
                                    height: 80,
                                    child: Icon(Icons.image_not_supported,
                                        size: 40),
                                  ),
                            const SizedBox(width: 16.0),
                            Expanded(
                              child: Custom_Text(
                                // Assuming Custom_Text can handle maxLines etc.
                                context,
                                text: product.name,
                                style: font10Black600W(context,
                                    size: size_14(
                                        context)), // Using your custom text style
                                maxLines: 2,
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(), // Convert map result to a List of Widgets
                ),
            ],
          );
        },
      ),
    );
  }
}
