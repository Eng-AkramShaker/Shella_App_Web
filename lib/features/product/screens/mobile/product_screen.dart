import 'package:flutter/material.dart';
<<<<<<< HEAD:lib/features/product/screens/product_screen.dart
import 'package:provider/provider.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';
import 'package:shella_design/features/product/controllers/store_details_provider.dart';
import 'package:shella_design/features/product/widgets/loader_screen/custom_loader.dart';
import 'package:shella_design/features/product/widgets/store_details_appbar/product_app_bar.dart';
import 'package:shella_design/features/product/widgets/store_details_category_chips/product_category_chips.dart';
import 'package:shella_design/features/product/widgets/store_details_list_view/product_list_view.dart';
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/divider/custom_divider.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_dimensions.dart';
import 'package:shella_design/common/util/app_styles.dart';
import '../../widgets/mobile/category/category_list.dart';
import '../../widgets/mobile/category/pizza_item.dart';
import '../../widgets/mobile/discount_list/discount_list.dart';
import '../../widgets/mobile/images/image_circle.dart';
>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2:lib/features/product/screens/mobile/product_screen.dart

class ProductView extends StatefulWidget {
  final StoreModel store;

  const ProductView({Key? key, required this.store}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
<<<<<<< HEAD:lib/features/product/screens/product_screen.dart
  late final StoreDetailsProvider _provider;
  late final ScrollController _scrollCtrl;

  @override
  void initState() {
    super.initState();
    _provider = StoreDetailsProvider(storeId: widget.store.id);
    _scrollCtrl = ScrollController()..addListener(_onScroll);
=======

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // ✅ الخلفية والهيدر في الأعلى
          Positioned.fill(
            top: MediaQuery.of(context).size.height * 0.4,
            child: SingleChildScrollView(
              // ✅ الحل الصحيح
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DiscountList(),
                  SizedBox(height: 15.h),
                  SizedBox(width: width_media(context), child: CategoryList()),
                  SizedBox(height: 15.h),
                  Container(
                    color: AppColors.gryColor_8,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Custom_Text(context, text: "ساندويش", style: font14Black600W(context)),
                    )),
                  SizedBox(height: 15.h),
                  buildPizzaItemListView(context),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ),
>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2:lib/features/product/screens/mobile/product_screen.dart

    _provider.loadStoreDetails().then((_) {
      _provider.loadProducts(refresh: true);
    });
  }

  void _onScroll() {
    if (_scrollCtrl.position.pixels >=
        _scrollCtrl.position.maxScrollExtent - 200) {
      _provider.loadProducts();
    }
  }

  @override
  void dispose() {
    _scrollCtrl.removeListener(_onScroll);
    _scrollCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _provider,
      child: Consumer<StoreDetailsProvider>(
        builder: (context, prov, _) {
          final store = prov.storeDetails;
          if (store == null && prov.isLoadingStoreDetails) {
            return Center(
              child: const CustomLoader(), 
            );
          }

          if (store == null) {
            return const Scaffold(
                body: Center(child: Text('Failed to load store data.')));
          }

          return Scaffold(
            backgroundColor: Colors.white,
            body: NestedScrollView(
              controller: _scrollCtrl,
              headerSliverBuilder: (_, __) => [
                ProductAppBar(store: widget.store),
                SliverPersistentHeader(
                  pinned: true,
                  delegate: ProductCategoryChips(
                    categories: store.categories,
                    selectedId: prov.selectedCategoryId,
                    onSelect: prov.setCategory,
                  ),
                ),
              ],
              body: ProductListView(provider: prov),
            ),
          );
        },
      ),
    );
  }
}
<<<<<<< HEAD:lib/features/product/screens/product_screen.dart
=======

Widget buildHeaderSection(BuildContext context,{image,isLoading}) {
  return SizedBox(
    height: 210.h,
    child: Stack(
      alignment: Alignment.center,
      children: [
        if(isLoading!=true)
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: image!=null?NetworkImage(image):AssetImage(AppImages.item_66), fit: BoxFit.fill),
            ),
          ),
        ),
        Positioned(
          top: 35.h,
          left: 19.w,
          right: 19.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Card(
                      color: AppColors.wtColor,
                      shape: CircleBorder(),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 7,top: 5,bottom: 5),
                        child: Icon(Icons.arrow_back_ios,size: 20,),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  IconButtonCircle(icon: Icons.search,iconsize: 20, onPressed: () {}),
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                    icon: Icons.share,
                    iconsize: 20,
                    onPressed: () {
                      Share.share('url', subject: 'Sharing Text Field Content');
                    }),
                  SizedBox(width: 12.w),
                  IconButtonCircle(
                    icon: Icons.favorite_border,
                    iconsize: 20,
                    onPressed: () {
                      popRoute(context);
                    }),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget buildSectionTitle(context, {required title, String? lapel}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 16.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Custom_Text(context, text: title, style: font14Black600W(context)),
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

Widget buildPizzaItemListView(BuildContext context) {
  return SizedBox(
    height: MediaQuery.of(context).size.height * 0.8,
    child: SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: List.generate(
          10,
          (index) => PizzaItem(
            onTap: () {
              pushNewScreen(context, AppRoutes.productDetails);
            },
          ),
        ),
      ),
    ),
  );
}
>>>>>>> 553c97d575268581ec96d36898f02f23b52e19c2:lib/features/product/screens/mobile/product_screen.dart
