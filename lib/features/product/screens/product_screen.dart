import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shella_design/common/helper/app_routes.dart';
import 'package:shella_design/common/util/app_images.dart';
import 'package:shella_design/common/widgets/buttons/icon_button_circle.dart';
import 'package:shella_design/common/widgets/divider/custom_divider.dart';
import 'package:shella_design/features/home/controllers/section_controller.dart';
import 'package:shella_design/features/home/domain/models/store_model.dart';
import 'package:shella_design/features/home/domain/services/section_service.dart';
import 'package:shella_design/features/home/home/widgets/category_Item.dart';
import 'package:shella_design/features/product/controllers/product_controller.dart';
import 'package:shella_design/common/widgets/texts/custom_text.dart';
import 'package:shella_design/common/widgets/texts/coustom_Text_Button.dart';
import 'package:shella_design/features/product/widgets/category/product_item.dart';
import 'package:shella_design/common/util/app_colors.dart';
import 'package:shella_design/common/util/app_navigators.dart';
import 'package:shella_design/common/util/app_styles.dart';

class ProductView extends StatefulWidget {
  final StoreModel store;

  const ProductView({super.key, required this.store});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
 SectionService _service=SectionService();
 
   late ScrollController _scrollController;

   bool endOfPage =false;

  @override
  void initState() {
    super.initState();
 //   _provider = ProductProvider(storeId: widget.store.id);
SectionProvider _provider = SectionProvider(_service);
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
   // _provider.loadProducts();
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {

          endOfPage = true;
     
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
      return Consumer<SectionProvider>(
        builder: (context, provider, _) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              alignment: Alignment.center,
              children: [
               // image of advertisment
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.4,
                  child: Container(
                     height: 126,
                    width:MediaQuery.of(context).size.width *0.9 ,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage
                      (image: AssetImage(AppImages.storeOffer),
                      fit: BoxFit.cover)
                    
                      
                    ),
                   
                   
                  ),
                ),
                // Scroll Content
               Positioned.fill(
                  top: MediaQuery.of(context).size.height * 0.6,
                  child: provider.isLoading && provider.categories.isEmpty
                      ? const Center(child: CircularProgressIndicator())
                      : GridView.builder(
                          controller: _scrollController,
                           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                   childAspectRatio: 1, // Square items
                 ),
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          itemCount: 
                              
                               provider.categories.length,
                          itemBuilder: (context, index) {
                            if (index == provider.categories.length) {
                              // Loader at the end for pagination
                              return const Padding(
                                padding: EdgeInsets.symmetric(vertical: 20),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              );
                            }
                            final category = provider.categories[index];
                            return CategoryItem(
                              image: category.imageFullUrl ?? AppImages.empty,
                              label: category.name,
                            
                            );
                          },
                        ),
                ),


                /////////// // footer store offer image   /////////
                   endOfPage==true ? Positioned(
                       top: MediaQuery.of(context).size.height * 0.8,
                      child: Container(
                     height: 126,
                    width:MediaQuery.of(context).size.width *0.9 ,
                    
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage
                      (image: AssetImage(AppImages.footerStoreImge),
                      fit: BoxFit.cover)
                    
                      
                    ),
                   
                   
                  ),
                      ) : Container(),

                // Header Section
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: buildHeaderSection(context)),
              

                // Store Info
                Positioned(
                  top: 150,
                  child: Card(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Custom_Text(context,
                              text: widget.store.name,
                              style: font14Black600W(context)),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Custom_Text(
                                context,
                                text:
                                    "${widget.store.module!.moduleType}" ,
                                style: font6SecondaryColor400W(context,size: 12),
                              ),
                              Custom_Text(context,
                              text: widget.store.currentOpeningTime ?? "10:00 Pm",
                              style: font12Black400W(context)),

                            ],
                          ),
                          const SizedBox(height: 15),
                          
                          
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Custom_Text(
                                context,
                                text: "قيمة التوصيل",
                                style: font12Black400W(context),
                              ),

                              Custom_Text(
                                context,
                                text: " المسافة",
                                style: font12Black400W(context),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                               Custom_Text(
                                context,
                                text: "${widget.store.deliveryFeeTax}",
                                style: font6SecondaryColor400W(context,size: 12),
                              ),

                              Custom_Text(
                                context,
                                text: "${widget.store.distance}",
                                style: font12Black400W(context),
                              ),
                            ],
                          
                          )
                        ],
                      ),
                    ),
                  ),
                ),

                // Store Logo
                Positioned(
                  top: 130,
                  left: MediaQuery.of(context).size.width * 0.45,
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          widget.store.logoUrl,
                        ///url for test  "https://mediaassets.cbre.com/cdn/-/media/project/cbre/shared-site/menat/saudi-arabia/articles/saudi-arabia-market-review-q2-2024/ksaq22024_report_image.png?iar=0&rev=e2547eb45e9b46eab325aac9f13e5303&key=articlehero-wideimage&device=desktop",
                          width: 40,
                          height: 40,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) => const Icon(Icons.store),
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        right: 5,
                        child: Container(
                          width: 12,
                          height: 12,
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
                  image: NetworkImage(
                    widget.store.coverPhotoUrl),
                  /// for test  "https://mediaassets.cbre.com/cdn/-/media/project/cbre/shared-site/menat/saudi-arabia/articles/saudi-arabia-market-review-q2-2024/ksaq22024_report_image.png?iar=0&rev=e2547eb45e9b46eab325aac9f13e5303&key=articlehero-wideimage&device=desktop"),
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

  Widget buildSectionTitle(BuildContext context,
      {required String title, String? lapel}) {
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
